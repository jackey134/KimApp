import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Data/ButtonData.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';
import 'package:kim_app/Tools/SlideLeftRoute.dart';
import 'package:kim_app/Tools/widgetfunction.dart';
import 'package:kim_app/buttons/Men_Hold.dart';
import 'package:kim_app/screens/homescreen.dart';
import 'package:kim_app/buttons/Men_MoveState.dart';
import 'package:kim_app/buttons/Men_Transport.dart';
import 'package:kim_app/screens/step2_1_ChoiceGender_view.dart';
import 'package:kim_app/screens/step3_result_view.dart';
import 'package:provider/provider.dart';
import '../Tools/Data/TargetListData.dart';
import '../Tools/SlideRightRoute.dart';
import '../Tools/constants.dart';
import '../buttons/Men_Uplift.dart';
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

  Future<void> showAlertDialog() async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "提示",
              style: TextStyle(fontSize: 30),
            ),
            content: const Text(
              "有選項未填",
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("確定"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TargetListData targetListData = Provider.of<TargetListData>(context);
    ButtonData buttonData = Provider.of<ButtonData>(context);
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
                  child: const Icon(
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
                height: constraints.maxHeight * 0.12,
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
                    height: 450,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Scrollbar(
                            child: Container(
                              height: 400,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  const Mybutton(),
                                  Container(
                                      height: 35, // 高度
                                      child: const Divider(
                                          thickness: 1, // 線的粗細
                                          height: 10, // 線的高度
                                          color: Colors.black // 線的顏色
                                          )),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
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
                                                const EdgeInsets.all(0.0),
                                            title: const Text("(<5s)",
                                                style: TextStyle(fontSize: 15)),
                                            value: 0,
                                            groupValue: _selectedButtonValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedButtonValue = value!;
                                                buttonData.resetSelections();
                                                targetListData
                                                        .isLiftingLevelChoiceCompleted =
                                                    false;
                                                targetListData
                                                        .isHoldingLevelChoiceCompleted =
                                                    false;
                                                targetListData
                                                        .isCarryingLevelChoiceCompleted =
                                                    false;
                                              });
                                            }),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0.0),
                                            title: const Text("(>5s)",
                                                style: TextStyle(fontSize: 15)),
                                            value: 1,
                                            groupValue: _selectedButtonValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedButtonValue = value!;
                                                buttonData.resetSelections();
                                                targetListData
                                                        .isLiftingLevelChoiceCompleted =
                                                    false;
                                                targetListData
                                                        .isHoldingLevelChoiceCompleted =
                                                    false;
                                                targetListData
                                                        .isCarryingLevelChoiceCompleted =
                                                    false;
                                              });
                                            }),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0.0),
                                            title: const Text(">5m",
                                                style: TextStyle(fontSize: 15)),
                                            value: 2,
                                            groupValue: _selectedButtonValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedButtonValue = value!;
                                                buttonData.resetSelections();
                                                targetListData
                                                        .isLiftingLevelChoiceCompleted =
                                                    false;
                                                targetListData
                                                        .isHoldingLevelChoiceCompleted =
                                                    false;
                                                targetListData
                                                        .isCarryingLevelChoiceCompleted =
                                                    false;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      height: 35, // 高度
                                      child: const Divider(
                                        thickness: 1, // 線的粗細
                                        height: 10, // 線的高度
                                        color: Colors.black, // 線的顏色
                                      )),
                                  IndexedStack(
                                    index: _selectedButtonValue,
                                    children: [
                                      //value = 0
                                      Mybutton2(
                                          myButton2selection:
                                              buttonData.myButton2Selection),
                                      //value = 1
                                      Mybutton3(
                                          myButton3selection:
                                              buttonData.myButton3Selection),
                                      //value = 2
                                      Mybutton4(
                                          myButton4selection:
                                              buttonData.myButton4Selection),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.02),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    debugPrint(
                        'isChoiceButtonCompleted:${targetListData.isChoiceButtonCompleted}');
                    debugPrint(
                        'isLoadLevelChoiceCompleted:${targetListData.isLoadLevelChoiceCompleted}');
                    debugPrint(
                        'isWorkingConditionChoiceCompleted:${targetListData.isWorkingConditionChoiceCompleted}');
                    debugPrint(
                        'isLiftingLevelChoiceCompleted:${targetListData.isLiftingLevelChoiceCompleted}');
                    debugPrint(
                        'isHoldingLevelChoiceCompleted:${targetListData.isHoldingLevelChoiceCompleted}');
                    debugPrint(
                        'isCarryingLevelChoiceCompleted:${targetListData.isCarryingLevelChoiceCompleted}');

                    if (targetListData.isLoadLevelChoiceCompleted &&
                        targetListData.isWorkingConditionChoiceCompleted &&
                        (targetListData.isLiftingLevelChoiceCompleted ||
                            targetListData.isHoldingLevelChoiceCompleted ||
                            targetListData.isCarryingLevelChoiceCompleted)) {
                      targetListData.isChoiceButtonCompleted = true;

                      targetListData.isLoadLevelChoiceCompleted = false;
                      targetListData.isWorkingConditionChoiceCompleted = false;
                      targetListData.isLiftingLevelChoiceCompleted = false;
                      targetListData.isHoldingLevelChoiceCompleted = false;
                      targetListData.isCarryingLevelChoiceCompleted = false;

                      buttonData.resetSelections();

                      Navigator.push(
                        context,
                        SlideRightRoute(
                          widget: TargetList(),
                        ),
                      );
                    } else {
                      showAlertDialog();
                    }
                  },
                  child: Container(
                    alignment: Alignment.topRight,
                    width: constraints.maxWidth * 0.3,
                    height: constraints.maxHeight * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xffF5F49B)),
                    child: const Center(
                      child: Text("完成", style: TextStyle(fontSize: 30)),
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
