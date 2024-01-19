

import 'package:flutter/foundation.dart';

class switchProvider with ChangeNotifier{
  bool _isActive = false;
  bool _isactive = false;
  bool _isThemeChange = false;

  bool get isActive => _isActive;
  bool get isactive => _isactive;
  bool get isThemeChange => _isThemeChange;

  void setIsActive (){
    _isActive = !_isActive;
    notifyListeners();
  }

  void setActive (){
    _isactive = !_isactive;
    notifyListeners();
  }
  void setThemeChange (){
    _isThemeChange = !_isThemeChange;
    notifyListeners();
  }
}