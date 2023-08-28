import 'package:flutter/material.dart';

class TargetListData extends ChangeNotifier {
  bool _isMan = false;
  bool _isCameraCompleted = false;
  bool _isGenderCompleted = false;
  bool _isChoiceButtonCompleted = false;

  bool _isLoadLevelChoiceCompleted = false;
  bool _isWorkingConditionChoiceCompleted = false;
  bool _isLiftingLevelChoiceCompleted = false;
  bool _isHoldingLevelChoiceCompleted = false;
  bool _isCarryingLevelChoiceCompleted = false;


  int _count = 0;

  int? _riskScore;

  int? get riskScore => _riskScore;


  bool get isMan => _isMan;
  bool get isCameraCompleted => _isCameraCompleted;
  bool get isGenderCompleted => _isGenderCompleted;
  bool get isChoiceButtonCompleted => _isChoiceButtonCompleted;

  bool get isLoadLevelChoiceCompleted => _isLoadLevelChoiceCompleted;
  bool get isWorkingConditionChoiceCompleted => _isWorkingConditionChoiceCompleted;
  bool get isLiftingLevelChoiceCompleted => _isLiftingLevelChoiceCompleted;
  bool get isHoldingLevelChoiceCompleted => _isHoldingLevelChoiceCompleted;
  bool get isCarryingLevelChoiceCompleted => _isCarryingLevelChoiceCompleted;


  int get count => _count;

  set riskScore(int? value){
    _riskScore = value;
    notifyListeners();
  }

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

  set isLoadLevelChoiceCompleted(bool value){
    _isLoadLevelChoiceCompleted = value;
    notifyListeners();
  }

  set isWorkingConditionChoiceCompleted(bool value){
    _isWorkingConditionChoiceCompleted = value;
    notifyListeners();
  }

  set isLiftingLevelChoiceCompleted(bool value){
    _isLiftingLevelChoiceCompleted = value;
    notifyListeners();
  }

  set isHoldingLevelChoiceCompleted(bool value){
    _isHoldingLevelChoiceCompleted = value;
    notifyListeners();
  }

  set isCarryingLevelChoiceCompleted(bool value){
    _isCarryingLevelChoiceCompleted = value;
    notifyListeners();
  }



  addCount(){
    _count++;
    notifyListeners();
  }


}
