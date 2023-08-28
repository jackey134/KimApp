import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Kim/Kim_Constans.dart';
import 'package:provider/provider.dart';

import '../Tools/Data/ButtonData.dart';
import '../Tools/Data/TargetListData.dart';

class Mybutton2 extends StatefulWidget {
  int? myButton2selection;
  Mybutton2({Key? key,required this.myButton2selection}) : super(key: key);

  @override
  State<Mybutton2> createState() => _Mybutton2();
}

class _Mybutton2 extends State<Mybutton2> {


  selectTime3(int? timeSelected) {
    setState(() {
      widget.myButton2selection = timeSelected!;
    });
  }

  @override
  Widget build(BuildContext context) {
    TargetListData targetListData = Provider.of<TargetListData>(context);
    ButtonData buttonData = Provider.of<ButtonData>(context);
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
                widget.myButton2selection = 1;
                TimeLevel.liftingScore = 1;
                debugPrint("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
                targetListData.isLiftingLevelChoiceCompleted = true;
                buttonData.setMyButton2Selection(1);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 100,
                  color: widget.myButton2selection == 1 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton2selection,
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
                widget.myButton2selection = 2;
                TimeLevel.liftingScore = 2;
                debugPrint("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
                targetListData.isLiftingLevelChoiceCompleted = true;
                buttonData.setMyButton2Selection(2);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: widget.myButton2selection == 2 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton2selection,
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
                widget.myButton2selection = 3;
                TimeLevel.liftingScore = 4;
                debugPrint("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
                targetListData.isLiftingLevelChoiceCompleted = true;
                buttonData.setMyButton2Selection(3);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 130,
                  color: widget.myButton2selection == 3 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton2selection,
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
                widget.myButton2selection = 4;
                TimeLevel.liftingScore = 6;
                debugPrint("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
                targetListData.isLiftingLevelChoiceCompleted = true;
                buttonData.setMyButton2Selection(4);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 135,
                  color: widget.myButton2selection == 4 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton2selection,
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
                widget.myButton2selection = 5;
                TimeLevel.liftingScore = 8;
                debugPrint("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
                targetListData.isLiftingLevelChoiceCompleted = true;
                buttonData.setMyButton2Selection(5);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 140,
                  color: widget.myButton2selection == 5 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton2selection,
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
                widget.myButton2selection = 6;
                TimeLevel.liftingScore = 10;
                debugPrint("當前男性抬舉或置放作業級別為: ${TimeLevel.lifting()}");
                targetListData.isLiftingLevelChoiceCompleted = true;
                buttonData.setMyButton2Selection(6);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 120,
                  color: widget.myButton2selection == 6 ? Colors.green : Colors.white,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,
                      groupValue: widget.myButton2selection,
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
