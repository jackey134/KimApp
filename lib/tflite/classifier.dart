import 'dart:math';
import 'dart:ui';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as imageLib;
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:kim_app/utils/image_utils.dart';

/// Classifier
class Classifier {
  late Interpreter _interpreter;
  late ImageProcessor imageProcessor;
  bool imageprocessed = false;

  static const String THUNDER_FILENAME = "movenet_thunder_int8.tflite";

  /// Shapes of output tensors
  late List<List<int>> _outputShapes;

  late TensorBuffer outputLocations;

  Classifier({Interpreter? interpreter}) {
    loadModel(interpreter: interpreter);
  }

  TensorImage getProcessedImage(TensorImage inputImage) {
    int padSize = max(inputImage.height, inputImage.width);
    if(!imageprocessed) {
      imageProcessor = ImageProcessorBuilder()
          .add(ResizeWithCropOrPadOp(padSize, padSize))
          .add(ResizeOp(256, 256, ResizeMethod.BILINEAR))
          .build();
      imageprocessed = true;
    }
    inputImage = imageProcessor.process(inputImage);
    return inputImage;
  }

  Future<List<dynamic>> runModel(imageLib.Image image) async {
    TensorImage inputImage = TensorImage.fromImage(image);
    inputImage = getProcessedImage(inputImage);

    List<Object> inputs = [inputImage.buffer];
    outputLocations = TensorBufferFloat(_outputShapes[0]);

    Map<int, Object> outputs = {0: outputLocations.buffer};

    interpreter.runForMultipleInputs(inputs, outputs);

    return outputLocations.getDoubleList();
  }

  loadModel({Interpreter? interpreter}) async {
    // final gpuDelegateV2 = GpuDelegateV2(options: GpuDelegateOptionsV2());
    // var interpreterOptions = InterpreterOptions()..addDelegate(gpuDelegateV2);

    try {
      _interpreter = interpreter ??
          await Interpreter.fromAsset(
            THUNDER_FILENAME,
            options: InterpreterOptions()..threads = 4,
            // options: interpreterOptions
          );
      var outputTensors = _interpreter.getOutputTensors();
      _outputShapes = [];
      outputTensors.forEach((tensor) {
        _outputShapes.add(tensor.shape);
      });
    } catch (e) {
      print("Error while creating interpreter: $e");
    }
    // outputLocations = TensorBufferFloat([1, 1, 17, 3]);
  }

  Interpreter get interpreter => _interpreter;
}
