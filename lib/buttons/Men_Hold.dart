import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';
import 'package:provider/provider.dart';

import '../Tools/Data/ButtonData.dart';
import '../Tools/Data/TargetListData.dart';

class Mybutton3 extends StatefulWidget {
  int? myButton3selection;
  Mybutton3({Key? key, required this.myButton3selection}) : super(key: key);

  @override
  State<Mybutton3> createState() => _Mybutton3();
}

class _Mybutton3 extends State<Mybutton3> {
  selectTime4(int? timeSelected) {
    setState(() {
      widget.myButton3selection = timeSelected!;
    });
  }

  @override
  Widget build(BuildContext context) {
    TargetListData targetListData = Provider.of<TargetListData>(context);
    ButtonData buttonData = Provider.of<ButtonData>(context, listen: true);
    return Container(
      child: Column(
        children: <Widget>[
          const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("握持作業", style: TextStyle(fontSize: 20)),
          ]),
          InkWell(
            onTap: () {
              setState(() {
                widget.myButton3selection = 1;
                TimeLevel.holdingTimeScore = 1;
                debugPrint("當前男性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
                buttonData.setMyButton3Selection(1);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 100,
                  color: widget.myButton3selection == 1
                      ? Colors.green
                      : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton3selection,
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
                widget.myButton3selection = 2;
                TimeLevel.holdingTimeScore = 2;
                debugPrint("當前男性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
                buttonData.setMyButton3Selection(2);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: widget.myButton3selection == 2
                      ? Colors.green
                      : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton3selection,
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
                widget.myButton3selection = 3;
                TimeLevel.holdingTimeScore = 4;
                debugPrint("當前男性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
                buttonData.setMyButton3Selection(3);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 140,
                  color: widget.myButton3selection == 3
                      ? Colors.green
                      : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton3selection,
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
                widget.myButton3selection = 4;
                TimeLevel.holdingTimeScore = 6;
                debugPrint("當前男性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
                buttonData.setMyButton3Selection(4);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: widget.myButton3selection == 4
                      ? Colors.green
                      : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton3selection,
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
                widget.myButton3selection = 5;
                TimeLevel.holdingTimeScore = 8;
                debugPrint("當前男性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
                buttonData.setMyButton3Selection(5);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: widget.myButton3selection == 5
                      ? Colors.green
                      : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton3selection,
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
                widget.myButton3selection = 6;
                TimeLevel.holdingTimeScore = 10;
                debugPrint("當前男性握持作業級別為: ${TimeLevel.holding()}");
                targetListData.isHoldingLevelChoiceCompleted = true;
                buttonData.setMyButton3Selection(6);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: widget.myButton3selection == 6
                      ? Colors.green
                      : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton3selection,
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
