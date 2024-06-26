import 'dart:async';
import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:grady/Presentation/Screens/MainPages/report_screen.dart';
import '../../../core/notification/notification_helper.dart';
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
  bool useFrontCamera = false;
  late Timer _timer;
  List<double> distractionPercentages = [];


  @override
  void initState() {
    super.initState();
    initCamera();
    _timer = Timer.periodic(const Duration(seconds: 20), (timer) {
      calculateDistractionPercentage();
    });
  }

  initCamera() async {
    late List<CameraDescription> cameras;
    cameras = await availableCameras();
    controller = CameraController(
      cameras.firstWhere(
            (camera) => camera.lensDirection == (useFrontCamera ? CameraLensDirection.front : CameraLensDirection.back),
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
      });
    }).catchError((error) {
      log('Error initializing camera controller: $error');
    });
  }
  @override
  void dispose() async {
    super.dispose();
    controller.dispose();
  }

  void calculateDistractionPercentage() {
    int totalPeople = yoloResults.length;
    int distractedPeople = yoloResults
        .where((result) => result['tag'] == 'Distracted').length;
    double distractionPercentage = (distractedPeople / totalPeople) * 100 ;

    setState(() {
      distractionPercentages.add(distractionPercentage);
    });

    log('Distraction percentage: $distractionPercentage %');
  }
  double calculateAverageDistractionPercentage() {
    if (distractionPercentages.isEmpty) return 0.0;
    double sum = distractionPercentages.reduce((a, b) => a + b);
    return sum / distractionPercentages.length;
  }

  Future<void> saveAverageToFireStore(double average) async {
    final fireStore = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      await fireStore.collection('users').doc(currentUser.uid).update({'Percentage': (average)});
    }
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

  Future<void> stopDetection() async {
    setState(() {
      isDetecting = false;
      // yoloResults.clear();
    });

    double average = calculateAverageDistractionPercentage();
    await saveAverageToFireStore(average);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportScreen(distractionPercentages: distractionPercentages),
      ),
    );
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
    return Scaffold(
      body: Stack(
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
                stopDetection();},
                icon: const Icon(Icons.stop, color: Colors.red,), iconSize: 50,)
                  : IconButton(onPressed: () async {await startDetection();},
                icon: const Icon(Icons.play_arrow, color: Colors.white,), iconSize: 50,),
            ),
          ),
          Positioned(top: 20, right: 20, child: Row(children: [IconButton(icon:const Icon(Icons.switch_camera), onPressed: () {switchCamera();},),],),),
        ],
      ),
    );
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
    } catch (error) {
      log('!!yarab aya t7l al Error : $error');
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
          log(" Aya:$yoloResults ");
        });
        checkDistractions(result);
      }
    } catch (error) {
      log(' Error processing frame with YOLO: $error');
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

  void checkDistractions(List<Map<String, dynamic>> results) {
    int distractionCount = results.where((result) => result['tag'] == 'Distracted').length;
    if (distractionCount >= 1) {
      LocalNotificationService.showNotification('Attention Alert: "Heads up! $distractionCount students in the back row seem to be losing focus.');

    }
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
