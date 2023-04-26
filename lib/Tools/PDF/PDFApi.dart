import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';


class PDFApi {

  static Future<File> loadAsset(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();

    return _storeFile(path, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final path = "${await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DCIM)}/KimApp_report";

    final file = File('$path/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
