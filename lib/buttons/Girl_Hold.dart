import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';
import 'package:provider/provider.dart';

import '../Tools/Data/TargetListData.dart';

class Mybutton3_Girl extends StatefulWidget {
  const Mybutton3_Girl({Key? key}) : super(key: key);

  @override
  State<Mybutton3_Girl> createState() => _Mybutton3_Girl();
}

class _Mybutton3_Girl extends State<Mybutton3_Girl> {
  int _selection4_Girl = 0;

  selectTime4(int? timeSelected) {
    setState(() {
      _selection4_Girl = timeSelected!;
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
            children: const [
              Text(
                "握持作業",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection4_Girl = 1;
                TimeLevel.holdingTimeScore = 1;
                debugPrint("當前女性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 100,
                  color: _selection4_Girl == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4_Girl,
                      onChanged: selectTime4,
                      value: 1,
                    ),
                    Text(
                      "< 5 min",
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
                _selection4_Girl = 2;
                TimeLevel.holdingTimeScore = 2;
                debugPrint("當前女性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection4_Girl == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4_Girl,
                      onChanged: selectTime4,
                      value: 2,
                    ),
                    Text(
                      "5 ~ 15 min",
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
                _selection4_Girl = 3;
                TimeLevel.holdingTimeScore = 4;
                debugPrint("當前女性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 140,
                  color: _selection4_Girl == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4_Girl,
                      onChanged: selectTime4,
                      value: 3,
                    ),
                    Text(
                      "15 min ~ 1 hr",
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
                _selection4_Girl = 4;
                TimeLevel.holdingTimeScore = 6;
                debugPrint("當前女性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection4_Girl == 4 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4_Girl,
                      onChanged: selectTime4,
                      value: 4,
                    ),
                    Text(
                      "1 ~ 2 hrs",
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
                _selection4_Girl = 5;
                TimeLevel.holdingTimeScore = 8;
                debugPrint("當前女性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection4_Girl == 5 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4_Girl,
                      onChanged: selectTime4,
                      value: 5,
                    ),
                    Text(
                      "2 ~ 4 hrs",
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
                _selection4_Girl = 6;
                TimeLevel.holdingTimeScore = 10;
                debugPrint("當前女性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection4_Girl == 6 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4_Girl,
                      onChanged: selectTime4,
                      value: 6,
                    ),
                    Text(
                      ">= 4 hrs",
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
