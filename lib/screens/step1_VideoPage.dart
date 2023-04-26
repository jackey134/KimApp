import 'dart:developer';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kim_app/screens/TargetList.dart';
import 'package:kim_app/screens/step2_1_ChoiceGender_view.dart';
import 'package:kim_app/tflite/classifier.dart';
import 'package:permission_handler/permission_handler.dart';

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

  /// Results to draw bounding boxes
  late List<Recognition> results;

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pop(
                        context, SlideLeftRoute(widget: Homescreen()));
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
                  Container(
                    height: height * 0.6,
                    width: width,
                    margin: const EdgeInsets.all(5.0),
                    child: CameraView(resultsCallback),
                  ),
                ],
              ),
              //這邊可以塞畫面
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
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
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pop(
                        context,
                        SlideRightRoute(
                          widget: TartgetList(
                            isMan: false,
                          ),
                        ),
                      );
                    });
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
            ),
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
