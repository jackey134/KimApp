import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';
import 'package:provider/provider.dart';

import '../Tools/Data/TargetListData.dart';

class Mybutton extends StatefulWidget {
  const Mybutton({Key? key}) : super(key: key);

  @override
  State<Mybutton> createState() => _Mybutton();
}

class _Mybutton extends State<Mybutton> {
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

  @override
  Widget build(BuildContext context) {
    TargetListData targetListData = Provider.of<TargetListData>(context);
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "搬運物荷重",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection1 = 1;
                LoadLevel.manLoad = 1;
                debugPrint("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
                targetListData.isLoadLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 100,
                  color: _selection1 == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1,
                      onChanged: selectTime1,
                      value: 1,
                    ),
                    Text(
                      "< 10 kg",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection1 = 2;
                LoadLevel.manLoad = 2;
                debugPrint("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
                targetListData.isLoadLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection1 == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1,
                      onChanged: selectTime1,
                      value: 2,
                    ),
                    Text(
                      "10 ~ 20 kg",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection1 = 3;
                LoadLevel.manLoad = 3;
                debugPrint("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
                targetListData.isLoadLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection1 == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1,
                      onChanged: selectTime1,
                      value: 3,
                    ),
                    Text(
                      "20 ~ 30 kg",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection1 = 4;
                LoadLevel.manLoad = 4;
                debugPrint("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
                targetListData.isLoadLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection1 == 4 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1,
                      onChanged: selectTime1,
                      value: 4,
                    ),
                    Text(
                      "30 ~ 40 kg",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection1 = 5;
                LoadLevel.manLoad = 5;
                debugPrint("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
                targetListData.isLoadLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection1 == 5 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1,
                      onChanged: selectTime1,
                      value: 5,
                    ),
                    Text(
                      ">= 40 kg",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: 35, // 高度
              child: Divider(
                thickness: 1, // 線的粗細
                height: 10, // 線的高度
                color: Colors.black, // 線的顏色
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "工作狀態評級",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection2 = 1;
                //WorkingCondition.levelGood();
                WorkingCondition.workingScore = 1;
                debugPrint("當前工作狀況評級為: ${WorkingCondition.workLevel()}");
                targetListData.isWorkingConditionChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 180,
                  color: _selection2 == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection2,
                      onChanged: selectTime2,
                      value: 1,
                    ),
                    Text(
                      "具備良好的人因條件",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection2 = 2;
                //WorkingCondition.levelNormal();
                WorkingCondition.workingScore = 2;
                debugPrint("當前工作狀況評級為: ${WorkingCondition.workLevel()}");
                targetListData.isWorkingConditionChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 265,
                  color: _selection2 == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection2,
                      onChanged: selectTime2,
                      value: 2,
                    ),
                    Text(
                      "運動空間受限或不符合人因的條件",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection2 = 3;
                //WorkingCondition.levelBad();
                WorkingCondition.workingScore = 3;
                debugPrint("當前工作狀況評級為: ${WorkingCondition.workLevel()}");
                targetListData.isWorkingConditionChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 250,
                  color: _selection2 == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection2,
                      onChanged: selectTime2,
                      value: 3,
                    ),
                    Text(
                      "運動空間受限或重心不穩的荷重",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
