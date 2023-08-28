import 'package:flutter/material.dart';
import 'package:kim_app/Tools/SlideLeftRoute.dart';
import 'package:kim_app/Tools/widgetfunction.dart';
import 'package:kim_app/screens/homescreen.dart';
import 'package:kim_app/screens/step2_2_GirlChoiceButton_view.dart';
import 'package:kim_app/screens/step2_2_MenChoiceButton_view.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';
import 'package:provider/provider.dart';

import '../Tools/Data/TargetListData.dart';
import '../Tools/SlideRightRoute.dart';
import '../Tools/constants.dart';
import 'TargetList.dart';

class Step2_choicegender_view extends StatefulWidget {
  const Step2_choicegender_view({Key? key}) : super(key: key);

  @override
  State<Step2_choicegender_view> createState() =>
      _Step2_choicegender_viewState();
}

class _Step2_choicegender_viewState extends State<Step2_choicegender_view> {
  @override
  Widget build(BuildContext context) {
    var targetListData = Provider.of<TargetListData>(context);
    final ThemeData themeData = Theme.of(context);
    bool _isMan = true;

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
                      Navigator.pop(
                          context, SlideLeftRoute(widget: const TargetList()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      color: colorPaleGray,
                      child: Icon(
                        Icons.arrow_back,
                        size: constraints.maxHeight * 0.05,
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
                            "選擇性別",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "*請點擊下方圖片",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        targetListData.isMan = true;
                        targetListData.isGenderCompleted = true;
                        targetListData.isChoiceButtonCompleted = false;
                        debugPrint(
                            'isGenderCompleted: ${targetListData.isGenderCompleted}');
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: TargetList(),
                          ),
                        );
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.4,
                        height: constraints.maxHeight * 0.3,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Image.asset(
                                'assets/images/man.png',
                                fit: BoxFit.contain, //填滿sizeBox的指令
                              ),
                            ),
                            const Text("男性",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        targetListData.isMan = false;
                        targetListData.isGenderCompleted = true;
                        targetListData.isChoiceButtonCompleted = false;
                        debugPrint(
                            'isGenderCompleted: ${targetListData.isGenderCompleted}');
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: TargetList(),
                          ),
                        );
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.4,
                        height: constraints.maxHeight * 0.3,
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/images/girl.png',
                                fit: BoxFit.contain, //填滿sizeBox的指令
                              ),
                            ),
                            const Text("女性",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
