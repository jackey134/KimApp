import 'package:flutter/material.dart';
import 'package:kim_app/Tools/constants.dart';
import 'package:kim_app/Tools/widgetfunction.dart';
import 'package:kim_app/screens/step2_1_ChoiceGender_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../Tools/Data/TargetListData.dart';
import '../Tools/PDF/PDFViewPage.dart';
import '../Tools/SlideLeftRoute.dart';
import '../Tools/PDF/PDFApi.dart';
import '../Tools/SlideRightRoute.dart';
import '../Tools/folders/create_folder.dart';
import '../Tools/Kim/Kim_Constans.dart';
import 'homescreen.dart';

class Result_view extends StatefulWidget {
  //final int riskScore;
  const Result_view({Key? key}) : super(key: key);

  @override
  State<Result_view> createState() => _Result_viewState();
}


class _Result_viewState extends State<Result_view> {


  @override
  Widget build(BuildContext context) {
    final targetListData = Provider.of<TargetListData>(context);
    debugPrint("targetListData.riskScore: ${targetListData.riskScore}");

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPaleGray,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              //標題文字
              addVerticalSapce(constraints.maxHeight * 0.005),
              Container(
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.025),
                alignment: Alignment.centerLeft,
                child: Text("評測結果",
                    style: TextStyle(
                        fontSize: constraints.maxHeight * 0.05,
                        color: Colors.white)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //************* 風險值
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.225,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: constraints.maxWidth * 0.5,
                            height: constraints.maxHeight * 0.225,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 15,
                                color: targetListData.riskScore == 1
                                    ? Colors.green
                                    : targetListData.riskScore == 2
                                        ? Colors.amberAccent
                                        : targetListData.riskScore == 4
                                            ? Colors.orange
                                            : targetListData.riskScore == 8
                                                ? Colors.red
                                                : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.02),
                            child: Text(
                              "${targetListData.riskScore}",
                              style: TextStyle(
                                fontSize: constraints.maxHeight * 0.08,
                                color: targetListData.riskScore == 1
                                    ? Colors.green
                                    : targetListData.riskScore == 2
                                        ? Colors.amberAccent
                                        : targetListData.riskScore == 4
                                            ? Colors.orange
                                            : targetListData.riskScore == 8
                                                ? Colors.red
                                                : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.04),
                            child: Text(
                              targetListData.riskScore == 1
                                  ? "低風險"
                                  : targetListData.riskScore == 2
                                      ? "中等風險"
                                      : targetListData.riskScore == 4
                                          ? "中高風險"
                                          : targetListData.riskScore == 8
                                              ? "高風險"
                                              : "錯誤",
                              //textAlign: TextAlign.center, //constraints.maxHeight * 0.053
                              style: TextStyle(
                                fontSize: targetListData.riskScore == 1
                                    ? constraints.maxHeight * 0.053
                                    : targetListData.riskScore == 2
                                        ? constraints.maxHeight * 0.043
                                        : targetListData.riskScore == 4
                                            ? constraints.maxHeight * 0.043
                                            : targetListData.riskScore == 8
                                                ? constraints.maxHeight * 0.053
                                                : 0,
                                color: targetListData.riskScore == 1
                                    ? Colors.green
                                    : targetListData.riskScore == 2
                                        ? Colors.amberAccent
                                        : targetListData.riskScore == 4
                                            ? Colors.orange
                                            : targetListData.riskScore == 8
                                                ? Colors.red
                                                : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSapce(30),
                  //************* 警示文字
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.2,
                        child: Container(
                          width: constraints.maxWidth * 0.85,
                          height: constraints.maxHeight * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 13,
                                child: Text(
                                  "*提醒",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.red),
                                ),
                              ),
                              Center(
                                child: targetListData.riskScore == 1 ? Text(
                                  "目前風險等級為第1級為低負荷狀態\n非常良好的姿態!請繼續維持下去。",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                ) : targetListData.riskScore == 2 ? Text(
                                  "目前風險等級為第2級為中等負載狀態\n姿態稍微不正確!需慢慢調整自我姿態。",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ) : targetListData.riskScore == 4 ? Text(
                                  "目前風險等級為第4級為中高負載狀態\n姿態不正確!需要定期檢查。",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ) : targetListData.riskScore == 8 ? Text(
                                  "目前風險等級為第8級為高負載狀態\n姿態嚴重不正確!需立刻進行改善。",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ) : Text(
                                  "錯誤",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                )
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  addVerticalSapce(constraints.maxWidth * 0.025),
                  //************* What Next?
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      SizedBox(
                          width: constraints.maxWidth * 0.95,
                          height: constraints.maxHeight * 0.07,
                          child: Text(
                            "What Next?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: constraints.maxHeight * 0.05),
                          )),
                    ],
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: constraints.maxHeight * 0.2,
                        child: Container(
                          width: constraints.maxWidth * 0.85,
                          height: constraints.maxHeight * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: targetListData.riskScore == 1 ? Text(
                                  "此種風險等級不易產生生理做載的情形發生\n為最理想標準的姿態。",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ) : targetListData.riskScore == 2 ? Text(
                                  "此種風險等級需進一步調查及必要時進行改善\n針對此類族群應進行工作再設計。",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ) : targetListData.riskScore == 4 ? Text(
                                  "此種風險等級需近日內進行進一步調查及改善\n針對此類族群建議進行工作改善。",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ) : targetListData.riskScore == 8 ? Text(
                                  "此種風險等級必須立即進行調查及改善\n針對此類族群必須進行工作改善。",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ) : Text(
                                  "錯誤",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSapce(constraints.maxWidth * 0.025),
                  //************* 三個按鈕列
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () async {
                              //var status = await Permission.storage.request();
                              //if (status.isGranted) {
                                // 權限已授予 //這邊記得要改寫假如權限有跑過要職接近下一個
                                await createPDFNewDir();
                                // Navigator.push(context,
                                //   SlideLeftRoute(widget: PDFApi()));
                                final path =
                                    'assets/report/KIMAPP_NewReport01.pdf';
                                final file = await PDFApi.loadAsset(path,targetListData.isMan);

                                openPDF(context, file);
                                
                              // } else {
                              //   // 權限未被授予
                              //   Center(
                              //     child: CircularProgressIndicator(),
                              //   );
                              // }
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 95,
                                  height: 95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1000),
                                    color: COLOR_GRAY,
                                  ),
                                ),
                                Positioned(
                                  left: 16,
                                  top: 4,
                                  child: Icon(
                                    Icons.download,
                                    size: 63,
                                  ),
                                ),
                                Positioned(
                                  left: 15,
                                  top: 55,
                                  child: Text(
                                    "下載報告",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {

                              targetListData.isCameraCompleted = false;
                              targetListData.isGenderCompleted = false;
                              targetListData.isChoiceButtonCompleted = false;

                              targetListData.isMan = false;

                              targetListData.isLoadLevelChoiceCompleted = false;
                              targetListData.isWorkingConditionChoiceCompleted = false;
                              targetListData.isLiftingLevelChoiceCompleted = false;
                              targetListData.isHoldingLevelChoiceCompleted = false;
                              targetListData.isCarryingLevelChoiceCompleted = false;


                              Navigator.push(context,
                                  SlideRightRoute(widget: Homescreen()));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 95,
                                  height: 95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1000),
                                    color: COLOR_GRAY,
                                  ),
                                ),
                                Positioned(
                                  left: 16,
                                  top: 4,
                                  child: Icon(
                                    Icons.restart_alt,
                                    size: 63,
                                  ),
                                ),
                                Positioned(
                                  left: 15,
                                  top: 55,
                                  child: Text(
                                    "重新測試",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewPage(file: file)),
      );

//   Future requestPermission() async {
//     if (await Permission.contacts.request().isGranted) {
// // Either the permission was already granted before or the user just granted it.
//     }
// // You can request multiple permissions at once.
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//       Permission.manageExternalStorage,
//     ].request();
//     debugPrint(statuses[Permission.storage]);
//   }
}
