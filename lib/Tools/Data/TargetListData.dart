import 'package:flutter/material.dart';

class TargetListData extends ChangeNotifier {
  bool _isMan = false;
  bool _isCameraCompleted = false;
  bool _isGenderCompleted = false;
  bool _isChoiceButtonCompleted = false;
  int _count = 0;


  bool get isMan => _isMan;
  bool get isCameraCompleted => _isCameraCompleted;
  bool get isGenderCompleted => _isGenderCompleted;
  bool get isChoiceButtonCompleted => _isChoiceButtonCompleted;
  int get count => _count;

  set isMan(bool value) {
    _isMan = value;
    notifyListeners();
  }

  set isCameraCompleted(bool value) {
    _isCameraCompleted = value;
    notifyListeners();
  }

  set isGenderCompleted(bool value) {
    _isGenderCompleted = value;
    notifyListeners();
  }

  set isChoiceButtonCompleted(bool value){
    _isChoiceButtonCompleted = value;
    notifyListeners();
  }

  addCount(){
    _count++;
    notifyListeners();
  }


}
