import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kim_app/screens/step1_VideoPage.dart';
import 'package:kim_app/screens/step2_1_ChoiceGender_view.dart';
import 'package:kim_app/tflite/classifier.dart';
import 'package:kim_app/tflite/nn_classifier.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Tools/SlideLeftRoute.dart';
import '../Tools/SlideRightRoute.dart';
import '../Tools/constants.dart';

import 'package:kim_app/utils/isolate_utiles.dart';

import '../tflite/classifier.dart';
import '../tflite/recognition.dart';

import 'homescreen.dart';
import 'package:kim_app/main.dart';

bool button = false;
List<List> resultList = [];

void countTest(bool isCount){
  if(button != isCount && isCount == true){
    resultList.clear();
  }
  button = isCount;
}
Future _fromFutureToString(Future<String> str) {
  return Future.value(str);
}

Future<void> processResultList(List<List<dynamic>> resultList) async {
  late String label_result;
  late String label_final_result;
  List<String> label_result_list = [];
  List<String> label_final_result_list = [];
  NNClassifier resultClassifier = NNClassifier();
  await Future.delayed(Duration(seconds: 1)); // 設定打開模型為1秒
  print(resultList.length);
  for (var i = 0; i < resultList.length; i++) {
    List flattenedList = resultList[i].expand((list) => list).toList();
    List doubleList = flattenedList.map((i) => i.toDouble()).toList();
    // print(doubleList); // [1, 2, 3, 4, 5, 6, ..., 51]

    Future result = _fromFutureToString(resultClassifier.classify(doubleList));
    label_result = await result;
  }
  for (var i = 0; i < resultList.length; i++) {
    List flattenedList = resultList[i].expand((list) => list).toList();
    List doubleList = flattenedList.map((i) => i.toDouble()).toList();

    Future result = _fromFutureToString(resultClassifier.classify(doubleList));
    label_result = await result;

    label_result_list.add(
        label_result); // 將 label_result 添加到 label_result_list 中
  }
  print(label_result_list);
  for (int i = 0; i < label_result_list.length; i ++) {
    if (i + 10 > label_result_list.length) {
      break;
    }
    List<String> slice = label_result_list.sublist(i, i + 10).map((item) => item.toString()).toList();
    Map<String, int> counts = {};
    slice.forEach((label) {
      counts[label] = counts.containsKey(label) ? counts[label]! + 1 : 1;
    });
    String mostFrequent="";
    int maxCount = 0;
    counts.forEach((label, count) {
      if (count > maxCount) {
        mostFrequent = label;
        maxCount = count;
      }
      if(maxCount>8){
        label_final_result_list.add(label);
      }
    });
    print('第${i}个切片中出现最多的元素是 $mostFrequent，共出現了 $maxCount 次');
  }
  if(label_final_result_list.contains('label20')){
    label_final_result = 'label20';
  }else if(label_final_result_list.contains('label15')){
    label_final_result = 'label15';
  }else if(label_final_result_list.contains('label5')){
    label_final_result = 'label5';
  }else{
    label_final_result = 'label0';
  }
  print(label_final_result); //輸出最終評級
}

class CameraView extends StatefulWidget {
  /// Callback to pass results after inference to [step1_VideoPage]
  final Function(List<Recognition> recognitions) resultsCallback;

  /// Constructor
  const CameraView(this.resultsCallback);
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  CameraController? controller;

  /// Instance of [Classifier]
  late Classifier classifier;

  /// Instance of [IsolateUtils]
  late IsolateUtils isolate;

  late bool predicting;
  bool initialized = false;

  bool _isCameraInitialized = false;
  bool _isCameraPermissionGranted = false;

  late List<dynamic> inferences;

  late int width;
  late int height;

  getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;
    // await Permission.manageExternalStorage.request();

    if (status.isGranted) {
      log('Camera Permission: GRANTED');
      setState(() {
        _isCameraPermissionGranted = true;
      });
      // Set and initialize the new camera
      initializeCamera();
    } else {
      log('Camera Permission: DENIED');
    }
  }

  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initializeCamera();
    }
  }

  void initStateAsync() async {
    WidgetsBinding.instance.addObserver(this);

    // Spawn a new isolate
    isolate = IsolateUtils();
    await isolate.start();

    getPermissionStatus();

    // Create an instance of classifier to load model and labels
    classifier = Classifier();

    // Initially predicting = false
    predicting = false;
  }

  /// Initializes the camera by setting [cameraController]
  void initializeCamera() async {
    // cameras[0] for rear-camera

    final CameraController cameraController =
        CameraController(cameras[0], ResolutionPreset.veryHigh , enableAudio: false);

    cameraController.initialize().then((_) async {
      if (!mounted) {
        return;
      }
      await cameraController!.startImageStream(createIsolate);
    });

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height * 0.6;

    // Return empty container while the camera is not initialized
    if (controller == null || !controller!.value.isInitialized || !initialized) {
      return const Center(
        child: Text(
          'LOADING',
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    return
      CustomPaint(
        foregroundPainter: RenderLandmarks(inferences, width, height),
        child: CameraPreview(
          controller!,
        ),
      );
  }

  void createIsolate(CameraImage imageStream) async {
    if (predicting == true) {
      return;
    }

    setState(() {
      predicting = true;
    });

    var isolateData = IsolateData(imageStream, classifier.interpreter.address);
    List<dynamic> inferenceResults = await inference(isolateData);

    setState(() {
      inferences = inferenceResults;
      predicting = false;
      initialized = true;
    });
  }

  Future<List<dynamic>> inference(IsolateData isolateData) async {
    ReceivePort responsePort = ReceivePort();
    isolate.sendPort.send(isolateData..responsePort = responsePort.sendPort);
    var results = await responsePort.first;
    return results;
  }
}

class CameraViewSingleton {
  static double? ratio;
  static Size? screenSize;
  static Size? inputImageSize;
  static Size get actualPreviewSize =>
      Size(screenSize!.width, screenSize!.width * ratio!);
}

class RenderLandmarks extends CustomPainter {
  late List<dynamic> inferenceList;
  late PointMode pointMode;
  late List<dynamic> selectedLandmarks;

  // CORRECT POSTURE COLOR PROFILE
  var point_green = Paint()
    ..color = Colors.green
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 3.0;

  var edge_green = Paint()
    ..color = Colors.lightGreen
    ..strokeWidth = 3.0;

  // INCORRECT POSTURE COLOR PROFILE

  var point_red = Paint()
    ..color = Colors.red
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 3.0;

  var edge_orange = Paint()
    ..color = Colors.orange
    ..strokeWidth = 3.0;

  List<Offset> points_green = [];
  List<Offset> points_red = [];

  List<dynamic> edges = [
    [0, 1], // nose to left_eye
    [0, 2], // nose to right_eye
    [1, 3], // left_eye to left_ear
    [2, 4], // right_eye to right_ear
    [0, 5], // nose to left_shoulder
    [0, 6], // nose to right_shoulder
    [5, 7], // left_shoulder to left_elbow
    [7, 9], // left_elbow to left_wrist
    [6, 8], // right_shoulder to right_elbow
    [8, 10], // right_elbow to right_wrist
    [5, 6], // left_shoulder to right_shoulder
    [5, 11], // left_shoulder to left_hip
    [6, 12], // right_shoulder to right_hip
    [11, 12], // left_hip to right_hip
    [11, 13], // left_hip to left_knee
    [13, 15], // left_knee to left_ankle
    [12, 14], // right_hip to right_knee
    [14, 16] // right_knee to right_ankle
  ];

  RenderLandmarks(List<dynamic> inferences, width, height) {
    List result = [];
    var x, y, c;
    for (var i = 0; i < 51; i += 3) {
      y = (inferences[0 + i] * height).toInt();
      x = (inferences[1 + i] * width).toInt();
      c = (inferences[2 + i]);
      result.add([x, y, c]);
    }

    if(button){
      resultList.add(result);
      // print(result);
    }

    inferenceList = result;
  }
  @override
  void paint(Canvas canvas, Size size) {
    for (List<int> edge in edges) {
      if (inferenceList[edge[0]][2] > 0.25 &&
          inferenceList[edge[1]][2] > 0.25) {
        double vertex1X = inferenceList[edge[0]][0].toDouble();
        double vertex1Y = inferenceList[edge[0]][1].toDouble();
        double vertex2X = inferenceList[edge[1]][0].toDouble();
        double vertex2Y = inferenceList[edge[1]][1].toDouble();
        canvas.drawLine(Offset(vertex1X, vertex1Y), Offset(vertex2X, vertex2Y),
            edge_orange);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
