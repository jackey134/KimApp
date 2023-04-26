import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';

class Mybutton3 extends StatefulWidget {
  const Mybutton3({Key? key}) : super(key: key);

  @override
  State<Mybutton3> createState() => _Mybutton3();
}

class _Mybutton3 extends State<Mybutton3> {
  int _selection4 = 0;

  selectTime4(int? timeSelected) {
    setState(() {
      _selection4 = timeSelected!;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                _selection4 = 1;
                LoadLevel.manLoad = 1;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 100,
                  color: _selection4 == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4,
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
                _selection4 = 2;
                LoadLevel.manLoad = 2;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection4 == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4,
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
                _selection4 = 3;
                LoadLevel.manLoad = 3;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 140,
                  color: _selection4 == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4,
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
                _selection4 = 4;
                LoadLevel.manLoad = 4;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection4 == 4 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4,
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
                _selection4 = 5;
                LoadLevel.manLoad = 5;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection4 == 5 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4,
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
                _selection4 = 6;
                LoadLevel.manLoad = 6;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection4 == 6 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection4,
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