import 'dart:developer';
import 'dart:isolate';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kim_app/screens/TargetList.dart';
import 'package:kim_app/screens/step2_1_ChoiceGender_view.dart';
import 'package:kim_app/tflite/classifier.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../Tools/Data/TargetListData.dart';
import '../Tools/SlideLeftRoute.dart';
import '../Tools/SlideRightRoute.dart';
import '../Tools/constants.dart';

import '../tflite/classifier.dart';
import '../tflite/recognition.dart';

import 'homescreen.dart';
import 'package:kim_app/screens/camera_view.dart';

int control_num = 0;

class step1_VideoPage extends StatefulWidget with WidgetsBindingObserver {
  const step1_VideoPage({Key? key}) : super(key: key);

  @override
  State<step1_VideoPage> createState() => _step1_VideoPageState();
}

class _step1_VideoPageState extends State<step1_VideoPage> {
  bool _isCounting = false;
  bool _isTap = false;
  bool _isAdding = false;

  int count = 0;

  int number = 0;
  Timer? timer;

  /// Results to draw bounding boxes
  late List<Recognition> results;

  void startAdding() {
    setState(() {
      _isAdding = true;
    });

    Future.doWhile(() async {
      await Future.delayed(Duration(seconds: 1));
      if (_isAdding) {
        setState(() {
          number++;
        });
        return true;
      } else {
        return false;
      }
    });
  }

  void stopTimer() {
    _isAdding = false;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showAlertDialog();
    });
  }

  Future<void> showAlertDialog() async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "注意",
              style: TextStyle(fontSize: 30),
            ),
            content: Text(
              "影片時長須超過15秒",
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("確定"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var targetListData = Provider.of<TargetListData>(context);
    final ThemeData themeData = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print("width: $width}");
    print("height: $height");

    Future<void> startVideoRecording(control_num) async {
      try {
        if (control_num % 2 == 0) {
          setState(() {
            _isTap = false;
            _isCounting = false;
            countTest(_isCounting = false);
          });
        } else {
          control_num = 0;
          setState(() {
            _isCounting = true;
            countTest(_isCounting = true);
          });
        }
      } on CameraException catch (e) {
        print('Error');
      }
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: colorPaleGray,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // Navigator.pop(
                    //     context, SlideLeftRoute(widget: Homescreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    color: colorPaleGray,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.11,
                    child: const Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "拍攝影片",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "*請點擊快門進行錄製，再點擊錄製結束",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: height * 0.6,
                        width: width,
                        margin: const EdgeInsets.all(5.0),
                        child: CameraView(resultsCallback),
                      ),
                      Positioned(
                        top: 2,
                        right: 15,
                        child: Text(
                          "錄製時長:${number}",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                      Positioned(
                          top: 2,
                          left: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.question_mark,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () async {
                              await showAlertDialog();
                            },
                          )),
                    ],
                  )
                ],
              ),
              //這邊可以塞畫面
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    _isAdding ? stopTimer() : startAdding();

                    _isTap = true;
                    control_num += 1;
                    await startVideoRecording(control_num);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: _isTap ? Colors.white : Colors.white38,
                        size: height / 10, //80
                      ),
                      Icon(
                        Icons.circle,
                        color: _isTap ? Colors.red : Colors.white,
                        size: height / 12, //65
                      ),
                      _isTap
                          ? Icon(
                              Icons.stop_rounded,
                              color: Colors.white,
                              size: height / 32, //32
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: number >= 10,
              child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () async {
                    await Future.delayed(Duration(seconds: 1)); // 假設計算需要 1 秒鐘
                    processResultList(resultList);

                    targetListData.isCameraCompleted = true;
                    print(
                        'isCameraCompleted: ${targetListData.isCameraCompleted}');

                    Navigator.pop(
                      context,
                      SlideRightRoute(
                        widget: TargetList(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.topRight,
                    width: constraints.maxWidth * 0.3,
                    height: constraints.maxHeight * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xffF5F49B),
                    ),
                    child: Center(
                      child: Text(
                        "完成",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            ),),

          ],
        );
      }),
    ));
  }

  /// Callback to get inference results from [CameraView]
  void resultsCallback(List<Recognition> results) {
    setState(() {
      this.results = results;
    });
  }
}
