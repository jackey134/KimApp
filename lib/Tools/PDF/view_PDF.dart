import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import '../folders/create_folder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/material.dart';
import 'PDFApi.dart';

class PDF_Api extends StatefulWidget {
  const PDF_Api({Key? key}) : super(key: key);

  @override
  State<PDF_Api> createState() => _PDFApiState();
}

class _PDFApiState extends State<PDF_Api> {
  String? localPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "PDF viewer",
      //     style: TextStyle(fontSize: 20),
      //   ),
      //   centerTitle: true,
      // ),
      body: localPath != null
          ? PDFView(
              filePath: localPath,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

}
