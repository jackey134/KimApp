import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';

class Mybutton2_Girl extends StatefulWidget {
  const Mybutton2_Girl({Key? key}) : super(key: key);

  @override
  State<Mybutton2_Girl> createState() =>
      _Mybutton2_Girl();
}

class _Mybutton2_Girl
    extends State<Mybutton2_Girl> {
  int _selection3_Girl = 0;

  selectTime3(int? timeSelected) {
    setState(() {
      _selection3_Girl = timeSelected!;
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
                "一天作業次數",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection3_Girl = 1;
                LoadLevel.manLoad = 1;
                print("當前女性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 100,
                  color: _selection3_Girl == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3_Girl,
                      onChanged: selectTime3,
                      value: 1,
                    ),
                    Text(
                      "< 10 次",
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
                _selection3_Girl = 2;
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
                  color: _selection3_Girl == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3_Girl,
                      onChanged: selectTime3,
                      value: 2,
                    ),
                    Text(
                      "10 ~ 40 次",
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
                _selection3_Girl = 3;
                LoadLevel.manLoad = 3;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 130,
                  color: _selection3_Girl == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3_Girl,
                      onChanged: selectTime3,
                      value: 3,
                    ),
                    Text(
                      "40 ~ 200 次",
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
                _selection3_Girl = 4;
                LoadLevel.manLoad = 4;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 135,
                  color: _selection3_Girl == 4 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3_Girl,
                      onChanged: selectTime3,
                      value: 4,
                    ),
                    Text(
                      "200 ~ 500 次",
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
                _selection3_Girl = 5;
                LoadLevel.manLoad = 5;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 140,
                  color: _selection3_Girl == 5 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3_Girl,
                      onChanged: selectTime3,
                      value: 5,
                    ),
                    Text(
                      "500 ~ 1000 次",
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
                _selection3_Girl = 6;
                LoadLevel.manLoad = 6;
                print("當前男性搬運物荷重級別為: ${LoadLevel.manLoadLeveling()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection3_Girl == 6 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3_Girl,
                      onChanged: selectTime3,
                      value: 6,
                    ),
                    Text(
                      ">= 1000 次",
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
