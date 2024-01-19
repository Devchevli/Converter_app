

import 'package:flutter/foundation.dart';

class switchProvider with ChangeNotifier{
  bool _isplatformConvert = false;
  bool _isprofile = false;
  bool _isThemeChange = false;

  bool get isplatformChange => _isplatformConvert;
  bool get isprofile => _isprofile;
  bool get isThemeChange => _isThemeChange;

  void setplatform (){
    _isplatformConvert = !_isplatformConvert;
    notifyListeners();
  }

  void setprofile (){
    _isprofile = !_isprofile;
    notifyListeners();
  }
  void setThemeChange (){
    _isThemeChange = !_isThemeChange;
    notifyListeners();
  }
}