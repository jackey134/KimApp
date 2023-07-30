import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as imageLib;
import 'package:kim_app/utils/image_utils.dart';
import 'package:pdf/widgets.dart';
import 'package:kim_app/tflite/classifier.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class IsolateUtils {
  static const String DEBUG_NAME = "InferenceIsolate";

  late Isolate _isolate;
  ReceivePort _receivePort = ReceivePort();
  late SendPort _sendPort;

  SendPort get sendPort => _sendPort;

  Future<void> start() async {
    _isolate = await Isolate.spawn<SendPort>(
      entryPoint,
      _receivePort.sendPort,
      debugName: DEBUG_NAME,
    );

    _sendPort = await _receivePort.first;
  }

  static void entryPoint(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (final IsolateData isolateData in port) {
      if (isolateData != null) {
        Classifier classifier = Classifier(
            interpreter:
                Interpreter.fromAddress(isolateData.interpreterAddress));

        imageLib.Image image =
            ImageUtils.convertCameraImage(isolateData.cameraImage);

        if (Platform.isAndroid) {
          image = imageLib.copyRotate(image, 90);
        }

        Future<List<dynamic>> results = classifier.runModel(image);
        
        //2023/7/30改過這邊。遇到的問題是
        //您正在嘗試將一個不可傳遞的物件（results）通過 Isolate 的 SendPort 來傳遞。
        //在 Dart 中，當您嘗試通過 SendPort 傳遞物件時，這些物件必須是可序列化的，
        //或者是 Dart 預設支持的原始數據類型，例如 int、double、String 等。
        
        // 假設 results 的類型是 Future<List<dynamic>>，請等待它完成
        List<dynamic> resultsList = await results;

        // 將結果轉換為可序列化的 List 格式
        List<dynamic> serializableResults =
            resultsList.map((result) => result).toList();

        // 使用 SendPort 來傳遞可序列化的結果
        isolateData.responsePort.send(serializableResults);

        //isolateData.responsePort.send(results);
      }
    }
  }
}

class IsolateData {
  CameraImage cameraImage;
  int interpreterAddress;
  late SendPort responsePort;

  IsolateData(this.cameraImage, this.interpreterAddress);
}
