import 'package:flutter/material.dart';
import 'package:flutter_library/theme/theme.dart';

class ThemeBloc extends ChangeNotifier{
  ThemeData _themeData = lightMode;

  bool light = false;

  ThemeData get getThemeData => _themeData;
  bool get isLightMode => light;

  void toggleThemeMode(){
    light = !light;
    if(_themeData == lightMode){
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }
}