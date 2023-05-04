import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';

const COLOR_ORANGE = Color.fromRGBO(255, 229, 204, 1.0);
const COLOR_BLACK = Color.fromRGBO(48, 47, 48, 1.0);
const COLOR_GRAY = Color.fromRGBO(217, 217, 217, 1.0);
const COLOR_CLEAR_GRAY = Color.fromRGBO(173, 173, 173, 1);

const colorPaleGray = Color(0xff2E2E2E);
const colorGray = Color(0xff6A6D76);
const colorBeige = Color(0xffDFE2D2);
const colorPaleWhite = Color(0xffFEFDF8);
const colorPaleYellow = Color(0xffF5F49B);
const colorCement = Color(0xff767A67);
const colorRed = Color(0xff922323);
const colorDartBlue = Color(0xff142137);


const TextTheme TEXT_THEME_DEFAULT = TextTheme(
  displayLarge: TextStyle(
    color: COLOR_BLACK,
    fontSize: 60,
  ),
  displayMedium: TextStyle(
    color: COLOR_BLACK,
    fontSize: 40,
  ),
  displaySmall: TextStyle(
    color: COLOR_BLACK,
    fontSize: 20,
  ),
  headlineLarge: TextStyle(fontSize: 50),
  headlineMedium: TextStyle(fontSize: 40),
  headlineSmall: TextStyle(fontSize: 20),
  titleLarge: TextStyle(fontSize: 50),
  titleMedium: TextStyle(fontSize: 35),
  titleSmall: TextStyle(fontSize: 25),
);

//將dir設定為DCIM的路徑，啊我這邊多一個app不知道有沒有用
//var dcim_path = Directory("$dir/app");




