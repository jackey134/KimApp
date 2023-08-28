import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';
import 'package:provider/provider.dart';

import '../Tools/Data/ButtonData.dart';
import '../Tools/Data/TargetListData.dart';

class Mybutton4 extends StatefulWidget {
  int? myButton4selection;
  Mybutton4({Key? key,required this.myButton4selection}) : super(key: key);

  @override
  State<Mybutton4> createState() => _Mybutton4();
}

class _Mybutton4 extends State<Mybutton4> {


  selectTime5(int? timeSelected) {
    setState(() {
      widget.myButton4selection = timeSelected!;
    });
  }

  @override
  Widget build(BuildContext context) {
    TargetListData targetListData = Provider.of<TargetListData>(context);
    ButtonData buttonData = Provider.of<ButtonData>(context,listen: true);
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "運送作業",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.myButton4selection = 1;
                TimeLevel.carryingDistanceScore = 1;
                debugPrint("當前男性運送作業級別為: ${TimeLevel.carrying()}");
                targetListData.isCarryingLevelChoiceCompleted = true;
                buttonData.setMyButton4Selection(1);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: widget.myButton4selection == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton4selection,
                      onChanged: selectTime5,
                      value: 1,
                    ),
                    Text(
                      "< 300 m",
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
                widget.myButton4selection = 2;
                TimeLevel.carryingDistanceScore = 2;
                debugPrint("當前男性運送作業級別為: ${TimeLevel.carrying()}");
                targetListData.isCarryingLevelChoiceCompleted = true;
                buttonData.setMyButton4Selection(2);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 140,
                  color: widget.myButton4selection == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton4selection,
                      onChanged: selectTime5,
                      value: 2,
                    ),
                    Text(
                      "300 m ~ 1 km",
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
                widget.myButton4selection = 3;
                TimeLevel.carryingDistanceScore = 4;
                debugPrint("當前男性運送作業級別為: ${TimeLevel.carrying()}");
                targetListData.isCarryingLevelChoiceCompleted = true;
                buttonData.setMyButton4Selection(3);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: widget.myButton4selection == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton4selection,
                      onChanged: selectTime5,
                      value: 3,
                    ),
                    Text(
                      "1 ~ 4 km",
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
                widget.myButton4selection = 4;
                TimeLevel.carryingDistanceScore = 6;
                debugPrint("當前男性運送作業級別為: ${TimeLevel.carrying()}");
                targetListData.isCarryingLevelChoiceCompleted = true;
                buttonData.setMyButton4Selection(4);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: widget.myButton4selection == 4 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton4selection,
                      onChanged: selectTime5,
                      value: 4,
                    ),
                    Text(
                      "4 ~ 8 km",
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
                widget.myButton4selection = 5;
                TimeLevel.carryingDistanceScore = 8;
                debugPrint("當前男性運送作業級別為: ${TimeLevel.carrying()}");
                targetListData.isCarryingLevelChoiceCompleted = true;
                buttonData.setMyButton4Selection(5);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 140,
                  color: widget.myButton4selection == 5 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton4selection,
                      onChanged: selectTime5,
                      value: 5,
                    ),
                    Text(
                      "8 km ~ 16km",
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
                widget.myButton4selection = 6;
                TimeLevel.carryingDistanceScore = 10;
                debugPrint("當前男性運送作業級別為: ${TimeLevel.carrying()}");
                targetListData.isCarryingLevelChoiceCompleted = true;
                buttonData.setMyButton4Selection(6);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: widget.myButton4selection == 6 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton4selection,
                      onChanged: selectTime5,
                      value: 6,
                    ),
                    Text(
                      ">= 16 km",
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
