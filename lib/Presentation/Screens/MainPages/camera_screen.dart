import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:gallery_saver_plus/files.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription>cameras;
  const CameraScreen( this.cameras, {super.key});
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}
class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  bool isCapturing =false, _isFrontCamera=false, _isRecording=false;
  int _selectedCameraIndex=0;
  bool _isFlashOn=false;
  String _videoPath='';
  late Timer _timer;
  int _secondsElapsed = 0;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {

      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }
  void _flashLight(){
    if(_isFlashOn){
      controller.setFlashMode(FlashMode.off);
      setState(() {
        _isFlashOn = false;
      });
    }else{
      controller.setFlashMode(FlashMode.torch);
      setState(() {
        _isFlashOn = true;
      });
    }

  }
  void _switchCamera() async{
    if(controller != null){
      await controller.dispose();
    }
    _selectedCameraIndex=(_selectedCameraIndex+1) %widget.cameras.length;
    _imitCamera(_selectedCameraIndex);
  }
  Future<void> _imitCamera(int cameraIndex) async{
    controller=CameraController(widget.cameras[cameraIndex], ResolutionPreset.max);
    try{
      await controller.initialize();
      setState(() {
        if(cameraIndex ==0){
          _isFrontCamera=false;
        }else{
          _isFrontCamera=true;
        }
      });
    }catch(e){
      print('Error message is $e');
    }
  }
  void _takeRecord(){
    if(_isRecording){
      _stopVideoRecording();
    }else{
      _startVideoRecording();
    }
  }
  void _startVideoRecording()async{
    if(!controller.value.isRecordingVideo){
      final directory=await getTemporaryDirectory();
      final path='${directory.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4';
      try{
        await controller.initialize();
        await controller.startVideoRecording();
        setState(() {
          _videoPath=path;
           _isRecording=true;
        });
        _startTimer();
      }catch(e){
         print('er: $e');
         return;
      }
    }
  }
  void _stopVideoRecording()async {
    if (controller.value.isRecordingVideo) {
      try {
        final XFile videoFile = await controller.stopVideoRecording();
        setState(() {
          _isRecording = false;
        });
        if (_videoPath.isNotEmpty) {
          final File file = File(videoFile.path);
          await file.copy(_videoPath);
          await GallerySaver.saveVideo(_videoPath);
          _resetTimer();
          final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
          audioPlayer.open(Audio('assets/sounds/camera_shutter.mp3'));
          audioPlayer.play();



        }
      } catch (e) {
        print('er: $e');
        return;
      }
    }
  }
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void _resetTimer() {
    setState(() {
      _secondsElapsed = 0;
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration:const BoxDecoration(color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          InkWell(
                            onTap: ()=> _flashLight(),
                            child: _isFlashOn ?const Icon(Icons.flash_on,color: Colors.white,):const Icon(Icons.flash_off,color: Colors.white,),
                          ),

                          Center(
                            child: Text(
                              _isRecording ? _formatTime(_secondsElapsed) : '',
                              style:const TextStyle(color: Colors.white),
                            ),
                          ),
                          InkWell(onTap:()=>_switchCamera() ,child:const Icon(Icons.cameraswitch_sharp,color: Colors.white, ))

                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                    top: 50,
                    bottom: _isFrontCamera== false ?0:150,
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: CameraPreview(controller),
                    )),
                Positioned(
                    bottom: 0,left: 0,right: 0,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: _isFrontCamera == false ? Colors.black45: Colors.black,
                      ),
                      child:Column(
                        children: [
                          const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Video',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  _takeRecord();
                                },
                                child: Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            width: 2,
                                            color: Colors.white
                                        )
                                    ),
                                    child: _isRecording==false ?null:
                                    const Icon(Icons.stop,color: Colors.white,size: 40,)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],

                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
