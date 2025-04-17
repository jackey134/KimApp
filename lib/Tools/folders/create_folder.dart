import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// Future<String> createDCIMNewDir() async {
//   requestPermission();
//   final dir = await ExternalPath.getExternalStoragePublicDirectory(
//       ExternalPath.DIRECTORY_DCIM);
//   debugPrint(dir);
//   var file = Directory("$dir/KimApp_video");
//   debugPrint("$file");
//   try {
//     bool exists = await file.exists();
//     if (!exists) {
//       await file.create(recursive: true);
//       debugPrint("創建成功");
//     } else {
//       debugPrint("存在");
//     }
//   } catch (e) {
//     debugPrint("$e");
//   }
//   return file.path.toString();
// }

Future<String> createPDFNewDir() async {
  requestPermission();
  final dir = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DCIM);
  debugPrint(dir);
  var file = Directory("$dir/KimApp_report");
  debugPrint("$file");
  try {
    bool exists = await file.exists();
    if (!exists) {
      await file.create(recursive: true);
      debugPrint("創建成功");
    } else {
      debugPrint("存在");
    }
  } catch (e) {
    debugPrint("$e");
  }
  return file.path.toString();
}

Future requestPermission() async {
  if (await Permission.manageExternalStorage.request().isGranted) {
// Either the permission was already granted before or the user just granted it.
    debugPrint('manageExternalStorage授權完成');
  }
// You can request multiple permissions at once.
  // Map<Permission, PermissionStatus> statuses = await [
  //   Permission.storage,
  //   Permission.manageExternalStorage,
  // ].request();
  //debugPrint(statuses[Permission.storage]);
}
