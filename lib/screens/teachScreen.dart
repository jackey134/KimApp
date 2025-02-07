import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Tools/Data/ButtonData.dart';
import '../Tools/Data/TargetListData.dart';
import '../Tools/SlideRightRoute.dart';
import '../Tools/constants.dart';
import 'TargetList.dart';

class TeachScreen extends StatefulWidget {
  const TeachScreen({Key? key}) : super(key: key);

  @override
  State<TeachScreen> createState() => _TeachScreenState();
}

class _TeachScreenState extends State<TeachScreen> {
  @override
  Widget build(BuildContext context) {
    TargetListData targetListData = Provider.of<TargetListData>(context);
    ButtonData buttonData = Provider.of<ButtonData>(context);
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPaleGray,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
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
                            "使用說明",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "請詳細觀看使用說明，並依序完成以下作業流程。",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Stack(children: [
                      Container(
                        width: 370,
                        height: 450,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Scrollbar(
                                      child: Container(
                                          height: 400,
                                          child: ListView(
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Image.asset(
                                                  'assets/images/TargetPage.jpg',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                                Image.asset(
                                                  'assets/images/Target.png',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                                Image.asset(
                                                  'assets/images/TargetSelectOk.jpg',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                                Image.asset(
                                                  'assets/images/Arrow.jpg',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                                Image.asset(
                                                  'assets/images/FourRisk.jpg',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                                Image.asset(
                                                  'assets/images/RiskLevel.jpg',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                                Image.asset(
                                                  'assets/images/Arrow.jpg',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                                Image.asset(
                                                  'assets/images/ResultPage.jpg',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                                Image.asset(
                                                  'assets/images/Ending.png',
                                                  fit: BoxFit.contain, //填滿sizeBox的指令
                                                ),
                                              ]
                                      )))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        widget: TargetList(),
                      ),
                    );
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
                        "開始",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
