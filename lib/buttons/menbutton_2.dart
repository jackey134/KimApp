import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';

class Mybutton2 extends StatefulWidget {
  const Mybutton2({Key? key}) : super(key: key);

  @override
  State<Mybutton2> createState() =>
      _Mybutton2();
}

class _Mybutton2
    extends State<Mybutton2> {
  int _selection3 = 0;

  selectTime3(int? timeSelected) {
    setState(() {
      _selection3 = timeSelected!;
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
                "抬舉或置放作業",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selection3 = 1;
                TimeLevel.liftingScore = 1;
                print("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 100,
                  color: _selection3 == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3,
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
                _selection3 = 2;
                TimeLevel.liftingScore = 2;
                print("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection3 == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3,
                      onChanged: selectTime3,
                      value: 2,
                    ),
                    Text(
                      "10 ~ 40次",
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
                _selection3 = 3;
                TimeLevel.liftingScore = 4;
                print("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 130,
                  color: _selection3 == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3,
                      onChanged: selectTime3,
                      value: 3,
                    ),
                    Text(
                      "40 ~ 200次",
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
                _selection3 = 4;
                TimeLevel.liftingScore = 6;
                print("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 135,
                  color: _selection3 == 4 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3,
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
                _selection3 = 5;
                TimeLevel.liftingScore = 8;
                print("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 140,
                  color: _selection3 == 5 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3,
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
                _selection3 = 6;
                TimeLevel.liftingScore = 10;
                print("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: _selection3 == 6 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: _selection3,
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
