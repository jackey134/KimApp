import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';

class Mybutton_Girl extends StatefulWidget {
  const Mybutton_Girl({Key? key}) : super(key: key);

  @override
  State<Mybutton_Girl> createState() => _MybuttonGirl();
}

class _MybuttonGirl extends State<Mybutton_Girl> {
  int _selection1_Girl = 0;
  int _selection2_Girl = 0;

  selectTime1(int? timeSelected) {
    setState(() {
      _selection1_Girl = timeSelected!;
    });
  }

  selectTime2(int? timeSelected) {
    setState(() {
      _selection2_Girl = timeSelected!;
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
                "搬運物荷重",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection1_Girl = 1;
                LoadLevel.manLoad = 1;
                print("當前女性搬運物荷重級別為: ${LoadLevel.girlLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 90,
                  color: _selection1_Girl == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1_Girl,
                      onChanged: selectTime1,
                      value: 1,
                    ),
                    Text(
                      "< 5 kg",
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
                _selection1_Girl = 2;
                LoadLevel.manLoad = 2;
                print("當前女性搬運物荷重級別為: ${LoadLevel.girlLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection1_Girl == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1_Girl,
                      onChanged: selectTime1,
                      value: 2,
                    ),
                    Text(
                      "5 ~ 10 kg",
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
                _selection1_Girl = 3;
                LoadLevel.manLoad = 3;
                print("當前女性搬運物荷重級別為: ${LoadLevel.girlLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection1_Girl == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1_Girl,
                      onChanged: selectTime1,
                      value: 3,
                    ),
                    Text(
                      "10 ~ 15 kg",
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
                _selection1_Girl = 4;
                LoadLevel.manLoad = 4;
                print("當前女性搬運物荷重級別為: ${LoadLevel.girlLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection1_Girl == 4 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1_Girl,
                      onChanged: selectTime1,
                      value: 4,
                    ),
                    Text(
                      "15 ~ 25 kg",
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
                _selection1_Girl = 5;
                LoadLevel.manLoad = 5;
                print("當前女性搬運物荷重級別為: ${LoadLevel.girlLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 110,
                  color: _selection1_Girl == 5 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection1_Girl,
                      onChanged: selectTime1,
                      value: 5,
                    ),
                    Text(
                      ">= 25 kg",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: 35, // 高度
              child:Divider(
                thickness: 1, // 線的粗細
                height: 10, // 線的高度
                color: Colors.black, // 線的顏色
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "工作狀態評級",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection2_Girl = 1;
                print("當前工作狀況評級為: ${WorkingCondition.levelGood()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 180,
                  color: _selection2_Girl == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection2_Girl,
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
                _selection2_Girl = 2;
                print("當前工作狀況評級為: ${WorkingCondition.levelNormal()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 265,
                  color: _selection2_Girl == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection2_Girl,
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
                _selection2_Girl = 3;
                print("當前工作狀況評級為: ${WorkingCondition.levelBad()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 250,
                  color: _selection2_Girl == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection2_Girl,
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
