import 'package:flutter/cupertino.dart';
import '../components/dark-theme-pref.dart';

class DarkThemeProvider extends ChangeNotifier{
  DarkThemePref darkThemePrefs= DarkThemePref();
  bool _darkTheme=false;
  bool get getDarkTheme=>_darkTheme;

  set setDarkTheme(bool value){
    _darkTheme=value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}