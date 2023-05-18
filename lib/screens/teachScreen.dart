import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                Container(
                  width: 250,
                  height: 250,
                ),
                InkWell(
                  onTap: () {

                    print('isChoiceButtonCompleted:${targetListData.isChoiceButtonCompleted}');
                    print('isMan: ${targetListData.isMan}');
                    print('isCameraCompleted: ${targetListData.isCameraCompleted}');
                    print('isGenderCompleted: ${targetListData.isGenderCompleted}');

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
