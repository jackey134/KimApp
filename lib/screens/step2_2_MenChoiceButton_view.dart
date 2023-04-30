import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';
import 'package:kim_app/Tools/SlideLeftRoute.dart';
import 'package:kim_app/Tools/widgetfunction.dart';
import 'package:kim_app/buttons/menbutton_1.dart';
import 'package:kim_app/screens/homescreen.dart';
import 'package:kim_app/buttons/menbutton_3.dart';
import 'package:kim_app/buttons/menbutton_4.dart';
import 'package:kim_app/screens/step2_1_ChoiceGender_view.dart';
import 'package:kim_app/screens/step3_result_view.dart';
import '../Tools/SlideRightRoute.dart';
import '../Tools/constants.dart';
import '../buttons/menbutton_2.dart';
import 'TargetList.dart';

enum ButtonType { Mybutton2, Mybutton3, Mybutton4 }

class Step2_menchoicebutton_view extends StatefulWidget {
  const Step2_menchoicebutton_view({Key? key}) : super(key: key);

  @override
  State<Step2_menchoicebutton_view> createState() =>
      _Step2_menchoicebutton_viewState();
}

class _Step2_menchoicebutton_viewState
    extends State<Step2_menchoicebutton_view> {
  int _selection1 = 0;
  int _selection2 = 0;

  selectTime1(int? timeSelected) {
    setState(() {
      _selection1 = timeSelected!;
    });
  }

  selectTime2(int? timeSelected) {
    setState(() {
      _selection2 = timeSelected!;
    });
  }

  int _selectedButtonValue = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
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
                  Navigator.pop(context,
                      SlideLeftRoute(widget: Step2_choicegender_view()));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 8, top: 8),
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
                    height: 500,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Scrollbar(
                              child: Container(
                                  height: 450,
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Mybutton(),
                                      Container(
                                          height: 35, // 高度
                                          child: Divider(
                                            thickness: 1, // 線的粗細
                                            height: 10, // 線的高度
                                            color: Colors.black, // 線的顏色
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "當前工作時長(三選一)",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                                contentPadding:
                                                    EdgeInsets.all(0.0),
                                                title: Text(
                                                  "(<5s)",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                value: 0,
                                                groupValue:
                                                    _selectedButtonValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _selectedButtonValue =
                                                        value!;
                                                  });
                                                }),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                                contentPadding:
                                                    EdgeInsets.all(0.0),
                                                title: Text(
                                                  "(>5s)",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                value: 1,
                                                groupValue:
                                                    _selectedButtonValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _selectedButtonValue =
                                                        value!;
                                                  });
                                                }),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                                contentPadding:
                                                    EdgeInsets.all(0.0),
                                                title: Text(
                                                  ">5m",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                value: 2,
                                                groupValue:
                                                    _selectedButtonValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _selectedButtonValue =
                                                        value!;
                                                  });
                                                }),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          height: 35, // 高度
                                          child: Divider(
                                            thickness: 1, // 線的粗細
                                            height: 10, // 線的高度
                                            color: Colors.black, // 線的顏色
                                          )),
                                      IndexedStack(
                                          index: _selectedButtonValue,
                                          children: [
                                            Mybutton2(),
                                            Mybutton3(),
                                            Mybutton4()
                                          ]),
                                    ],
                                  )))
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.02,
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
}
