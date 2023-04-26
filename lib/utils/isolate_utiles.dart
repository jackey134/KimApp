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

        imageLib.Image image = ImageUtils.convertCameraImage(isolateData.cameraImage);

        if (Platform.isAndroid) {
          image = imageLib.copyRotate(image, 90);
        }

        Future<List<dynamic>> results = classifier.runModel(image);
        isolateData.responsePort.send(results);
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