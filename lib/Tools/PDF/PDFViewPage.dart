import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewPage extends StatefulWidget {
  final File file;

  const PDFViewPage({Key? key, required this.file}) : super(key: key);

  @override
  State<PDFViewPage> createState() => _PDFViewPageState();
}

class _PDFViewPageState extends State<PDFViewPage> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: widget.file != null
          ? PDFView(
              filePath: widget.file.path,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
