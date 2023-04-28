import 'package:flutter/material.dart';
import 'package:kim_app/Tools/SlideRightRoute.dart';
import 'package:kim_app/screens/step1_VideoPage.dart';
import 'package:kim_app/screens/step2_1_ChoiceGender_view.dart';
import 'package:kim_app/screens/step2_2_GirlChoiceButton_view.dart';
import 'package:kim_app/screens/step2_2_MenChoiceButton_view.dart';
import 'package:kim_app/screens/step3_result_view.dart';
import '../Tools/SlideLeftRoute.dart';
import '../Tools/camera_tools/camera_screen.dart';
import '../Tools/constants.dart';
import '../Tools/stepbutton.dart';
import '../Tools/Boxdecoration.dart';
import '../Tools/widgetfunction.dart';

class TartgetList extends StatefulWidget {
  final bool isMan;

  const TartgetList({Key? key, required this.isMan}) : super(key: key);

  @override
  State<TartgetList> createState() => _TartgetListState();
}

class _TartgetListState extends State<TartgetList> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    //final size = MediaQuery.of(context).size;
    //final width = size.width;
    //final height = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPaleGray,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              // <-
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context,
                        SlideLeftRoute(widget: Step2_choicegender_view()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 12, top: 8),
                    color: colorPaleGray,
                    child: Icon(
                      Icons.arrow_back,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              //title
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.11,
                  child: const Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "使用步驟",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "*請依序完成以下幾個需求以完成檢測",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //拍攝影片
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, SlideRightRoute(widget: step1_VideoPage()));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 12, top: 8, right: 12),
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.16,
                    decoration: BoxDecoration(
                      color: colorCement,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 15,
                          child: Text(
                            "完成(0/1)",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: Text(
                            "拍攝影片",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 15,
                          child: Text(
                            "01",
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          right: 8,
                          child: Icon(
                            Icons.video_camera_front,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //選擇性別
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      SlideRightRoute(widget: Step2_choicegender_view()));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 12, top: 30, right: 12),
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.16,
                    decoration: BoxDecoration(
                      color: colorRed,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 15,
                          child: Text(
                            "完成(0/1)",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: Text(
                            "選擇性別",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 15,
                          child: Text(
                            "02",
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          right: 8,
                          child: Icon(
                            Icons.people_alt,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //點選資料
              InkWell(
                onTap: () {
                  widget.isMan
                      ? Navigator.push(context,
                          SlideRightRoute(widget: Step2_menchoicebutton_view()))
                      : Navigator.push(context,
                          SlideRightRoute(widget: Step2_girlchoicebutton_view()));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 12, top: 30, right: 12),
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.16,
                    decoration: BoxDecoration(
                      color: colorDartBlue,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 15,
                          child: Text(
                            "完成(0/1)",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: Text(
                            "點選資料",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 15,
                          child: Text(
                            "03",
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          right: 8,
                          child: Icon(
                            Icons.list,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //間隔
              SizedBox(
                height: constraints.maxHeight * 0.1,
              ),
              //進行檢測
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context, SlideRightRoute(widget: Result_view()));
                  });
                },
                child: Container(
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxHeight * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffF5F49B),
                  ),
                  child: Center(
                    child: Text(
                      "KIM風險等級評估",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
