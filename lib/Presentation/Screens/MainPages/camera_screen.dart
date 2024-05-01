import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'dart:async';

class CameraScreen extends StatefulWidget {
  final FlutterVision vision = FlutterVision();
  CameraScreen({Key? key,}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  late List<Map<String, dynamic>> yoloResults;
  CameraImage? cameraImage;
  bool isLoaded = false;
  bool isDetecting = false;
  bool useFrontCamera = false, _isRecording=false;
  String _videoPath='';
  late Timer _timer;
  int _secondsElapsed = 0;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  initCamera() async {
    late List<CameraDescription> cameras;
     cameras = await availableCameras();
    controller = CameraController(
      cameras.firstWhere(
            (camera) => camera.lensDirection ==
            (useFrontCamera ? CameraLensDirection.front : CameraLensDirection.back),
      ),
      ResolutionPreset.medium,
    );
    controller.initialize().then((value) {
      loadYoloModel().then((value) {
        setState(() {
          isLoaded = true;
          isDetecting = false;
          yoloResults = [];
        });
      }).catchError((error) {
        log('Error loading YOLO model: $error');
        // Handle error loading YOLO model
      });
    }).catchError((error) {
      log('Error initializing camera controller: $error');
      // Handle error initializing camera controller
    });
  }

  @override
  void dispose() async {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (!isLoaded) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Colors.black,),
        ),
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller,),), ...displayBoxesAroundRecognizedObjects(size),
        Positioned(bottom: 75, width: MediaQuery.of(context).size.width,
          child: Container(height: 80, width: 80, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(
                  width: 5, color: Colors.white, style: BorderStyle.solid),
            ),
            child: isDetecting ? IconButton(onPressed: () async {
              // _takeRecord();
              stopDetection();},
              icon: const Icon(Icons.stop, color: Colors.red,), iconSize: 50,)
                : IconButton(onPressed: () async {await startDetection();},
                  icon: const Icon(Icons.play_arrow, color: Colors.white,), iconSize: 50,),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Row(
            children: [
              IconButton(
                icon:const Icon(Icons.switch_camera),
                onPressed: () {
                  switchCamera();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
  Future<void> switchCamera() async {
    setState(() {
      useFrontCamera = !useFrontCamera;
      isDetecting = false;
      yoloResults.clear();
    });
    await controller.dispose();
    initCamera();

}
  Future<void> loadYoloModel() async {
    try {
      await widget.vision.loadYoloModel(
        labels: 'assets/labels.txt',
        modelPath: 'assets/attention_detection.tflite',
        modelVersion: "yolov8",
        numThreads: 2, useGpu: true,

      );
      setState(() {isLoaded = true;});
      log('donnnnneee loooaded');
    } catch (error) {
      log('!!yarab aya t7l al Error loading YOLO model: $error');
      // Handle error loading YOLO model
    }
  }

  Future<void> yoloOnFrame(CameraImage cameraImage) async {
    try {
      final result = await widget.vision.yoloOnFrame(
        bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
      );
      if (result.isNotEmpty) {
        setState(() {
          yoloResults = result;
          log("###Aya:$yoloResults");
        });
      }
    } catch (error) {
      log('@@aya >> Error processing frame with YOLO: $error');
      // Handle error processing frame with YOLO
    }
  }

  Future<void> startDetection() async {
    setState(() {
      isDetecting = true;
    });
    if (controller.value.isStreamingImages) {
      return;
    }
    await controller.startImageStream((image) async {
      if (isDetecting) {
        cameraImage = image;
        yoloOnFrame(image);
      }
    });
  }

  Future<void> stopDetection() async {
    setState(() {
      isDetecting = false;
      yoloResults.clear();
    });
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (yoloResults.isEmpty) return [];
    double factorX = screen.width / (cameraImage?.height ?? 1);
    double factorY = screen.height / (cameraImage?.width ?? 1);

    Color colorPick = const Color.fromARGB(255, 50, 233, 30);

    return yoloResults.map((result) {
      return Positioned(
        left: result["box"][0] * factorX,
        top: result["box"][1] * factorY,
        width: (result["box"][2] - result["box"][0]) * factorX,
        height: (result["box"][3] - result["box"][1]) * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['tag']} ${(result['box'][4] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }).toList();
  }
}
