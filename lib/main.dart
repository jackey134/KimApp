import 'package:flutter/material.dart';
import 'package:kim_app/Tools/Data/TargetListData.dart';
import 'package:kim_app/Tools/Data/ButtonData.dart';
import 'package:kim_app/Tools/constants.dart';
import 'package:kim_app/screens/homescreen.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';


List<CameraDescription> cameras = [];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint("抓取相機失敗");
    throw('Error in fetching the cameras: $e');
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TargetListData()),
      ChangeNotifierProvider(create: (context) => ButtonData()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TEXT_THEME_DEFAULT),
      home: const Homescreen(),
    );
  }
}
