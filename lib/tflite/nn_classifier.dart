import 'dart:math';
import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

/// Classifier
class NNClassifier {
  late Interpreter _interpreter2;
  late List<String> labels;

  late List<int> _inputShape;
  late List<int> _outputShape;

  late TfLiteType _inputType;
  late TfLiteType _outputType;

  static const String MODEL_FILE_NAME = "pose_classifier_test.tflite";
  static const String LABEL_FILE_NAME = "assets/labels.txt";

  late TensorBuffer outputLocations;

  NNClassifier({Interpreter? interpreter}) {
    loadModel(interpreter: interpreter);
  }

  loadModel({Interpreter? interpreter}) async {
    try {
      _interpreter2 = interpreter ??
          await Interpreter.fromAsset(
            MODEL_FILE_NAME,
            options: InterpreterOptions()..threads = 4,
          );
     labels = await FileUtil.loadLabels(LABEL_FILE_NAME);

      _inputShape = _interpreter2.getInputTensor(0).shape; //[1, 51]
      _outputShape= _interpreter2.getOutputTensor(0).shape; //[1, 4]
      _inputType = _interpreter2.getInputTensor(0).type; //TfLiteType.float32
      _outputType = _interpreter2.getOutputTensor(0).type; //TfLiteType.float32
    } catch (e) {
      debugPrint("Error while creating interpreter: $e");
    }
  }

  Future<String> classify(List result) async {
    // List<double> output = List.filled(4, 0.0);
    // outputLocations = TensorBufferFloat(_outputShape);
    TensorBuffer output = TensorBuffer.createFixedSize(_outputShape, _outputType);
    // Map<int, Object> outputs = {0: output.buffer};
    _interpreter2.run(result, output.buffer);

    //映射label與機率
    TensorLabel tensorLabel = TensorLabel.fromList(
        labels, output);

    Map<String, double> doubleMap = tensorLabel.getMapWithFloatValue();

    //找最大value的key
    var thevalue=0.0;
    var thekey;
    doubleMap.forEach((k,v){
      if(v>thevalue) {
        thevalue = v;
        thekey = k;
      }
    });

    return thekey;
  }

  Interpreter get interpreter => _interpreter2;
}