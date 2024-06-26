// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class ReportScreen extends StatelessWidget {
//   final List<double> distractionPercentages;
//
//   const ReportScreen({super.key, required this.distractionPercentages});
//
//   @override
//   Widget build(BuildContext context) {
//     List<int> indices = List<int>.generate(distractionPercentages.length, (index) => index);
//     List<double> percentages = distractionPercentages;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Distraction Report'),
//         actions: [
//           InkWell(
//             onTap: (){},
//             child:const Icon(Icons.save,color: Colors.black,),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SizedBox(
//           height: 620,
//           child: SfCartesianChart(
//             primaryXAxis: const NumericAxis(
//               title: AxisTitle(text: 'Time'),
//               edgeLabelPlacement: EdgeLabelPlacement.shift,
//             ),
//             primaryYAxis: const NumericAxis(
//               title: AxisTitle(text: 'Distraction Percentage'),
//               labelFormat: '{value}%',
//             ),
//
//             tooltipBehavior: TooltipBehavior(enable: true),
//             series: [
//               LineSeries<double, int>(
//                 dataSource: percentages,
//                 xValueMapper: (value, index) => indices[index],
//                 yValueMapper: (value, _) => value,
//                 markerSettings: const MarkerSettings(isVisible: true),
//                 dataLabelSettings: const DataLabelSettings(isVisible: true),
//                 color: Colors.black.withOpacity(0.9),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../config/routes.dart';

class ReportScreen extends StatefulWidget {
  final List<double> distractionPercentages;

  const ReportScreen({super.key, required this.distractionPercentages});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final GlobalKey _chartKey = GlobalKey();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<int> indices = List<int>.generate(widget.distractionPercentages.length, (index) => index);
    List<double> percentages = widget.distractionPercentages;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Distraction Report'),
        actions: [
          _isLoading
              ?const Padding(padding:  EdgeInsets.all(8.0), child: CircularProgressIndicator(color: Colors.black),)
              : IconButton(icon: const Icon(Icons.save, color: Colors.black), onPressed: _saveChart,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RepaintBoundary(
          key: _chartKey,
          child: SizedBox(
            height: 620,
            child: SfCartesianChart(
              primaryXAxis: const NumericAxis(
                title: AxisTitle(text: 'Time'),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              primaryYAxis: const NumericAxis(
                title: AxisTitle(text: 'Distraction Percentage'),
                labelFormat: '{value}%',
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: [
                LineSeries<double, int>(
                  dataSource: percentages,
                  xValueMapper: (value, index) => indices[index],
                  yValueMapper: (value, _) => value,
                  markerSettings: const MarkerSettings(isVisible: true),
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  color: Colors.black.withOpacity(0.9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveChart() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final image = await _capturePng();
      final imageUrl = await _saveImageToFirebase(image);
      await _saveImageUrlToFireStore(imageUrl);
      router.go('/home');
    } catch (e) {
      // Handle error
      log(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<Uint8List> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = _chartKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      log(e.toString());
      return Uint8List(0);
    }
  }

  Future<String> _saveImageToFirebase(Uint8List imageBytes) async {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/graph.png';
    final file = File(filePath);
    await file.writeAsBytes(imageBytes);

    final storageRef = FirebaseStorage.instance.ref().child('graphs/graph_${DateTime.now().millisecondsSinceEpoch}.png');
    await storageRef.putFile(file);
    return await storageRef.getDownloadURL();
  }

  Future<void> _saveImageUrlToFireStore(String url) async {
    final fireStore = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      await fireStore.collection('users').doc(currentUser.uid).update({'graphUrl': url});
    }
  }
}

