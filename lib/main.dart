import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Data/TargetListData.dart';
import 'package:kim_app/Tools/constants.dart';
import 'package:kim_app/screens/TargetList.dart';
import 'package:kim_app/screens/homescreen.dart';
import 'package:camera/camera.dart';
import 'package:kim_app/screens/step1_VideoPage.dart';
import 'package:kim_app/screens/step2_1_ChoiceGender_view.dart';
import 'package:kim_app/screens/step2_2_GirlChoiceButton_view.dart';
import 'package:kim_app/screens/step2_2_MenChoiceButton_view.dart';
import 'package:kim_app/screens/step3_result_view.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'Tools/folders/create_folder.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  runApp(ChangeNotifierProvider(
    create: (context) => TargetListData(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TEXT_THEME_DEFAULT),
      home: Homescreen(),
    );
  }
}
