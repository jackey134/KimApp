import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../Data/TargetListData.dart';
import '../Kim/Kim_Constans.dart';


class PDFApi {
  static Future<File> loadAsset(String path, bool isMale) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();

    // 從本地文件系統中讀取 PDF 文件
    PdfDocument document = PdfDocument(inputBytes: bytes);
    print(document);

    // 從 PDF 文檔中讀取頁面
    final page = document.pages[0];

    // 在頁面上添加文本

    if(isMale){
      //男荷重
      page.graphics.drawString('${LoadLevel.manLoadLeveling()}',
          PdfStandardFont(PdfFontFamily.helvetica, 20),
          bounds: Rect.fromLTWH(260, 205, 100, 100));
    }else{
      //女荷重
      page.graphics.drawString('${LoadLevel.girlLoadLeveling()}',
          PdfStandardFont(PdfFontFamily.helvetica, 20),
          bounds: Rect.fromLTWH(415, 205, 100, 100));
    }

    //工作狀況評級
    page.graphics.drawString('${WorkingCondition.workingConditionLevel}',
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(340, 245, 100, 100));
    //姿勢評級
    page.graphics.drawString(
        '${PoseLevel.poseLevel}', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(340, 282, 100, 100));
    //時間評級*加總分數
    page.graphics.drawString(
        '${TimeLevel.timeLevel} x ${(LoadLevel.loadLevel + PoseLevel.poseLevel + WorkingCondition.workingConditionLevel)}',
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(340, 345, 100, 100));
    //最後得分
    page.graphics.drawString('${RiskLevel.riskLevelCount()}',
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(415, 393, 100, 100));

    // 把寫入的文字先存到List<int>裡面
    List<int> _bytes = await document.save();

    document.dispose();

    return _storeFile(path, _bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final path =
        "${await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DCIM)}/KimApp_report";

    final file = File('$path/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
