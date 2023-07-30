import 'package:flutter/cupertino.dart';

class ButtonData extends ChangeNotifier {
  int _myButton2Selection = 0;
  int _myButton3Selection = 0;
  int _myButton4Selection = 0;

  int get myButton2Selection => _myButton2Selection;

  int get myButton3Selection => _myButton3Selection;

  int get myButton4Selection => _myButton4Selection;

  void setMyButton2Selection(int value) {
    _myButton2Selection = value;
    notifyListeners();
  }

  void setMyButton3Selection(int value) {
    _myButton3Selection = value;
    notifyListeners();
  }

  void setMyButton4Selection(int value) {
    _myButton4Selection = value;
    notifyListeners();
  }

  void resetSelections() {
    _myButton2Selection = 0;
    _myButton3Selection = 0;
    _myButton4Selection = 0;
    notifyListeners();
  }
}
