import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodle_flutter/utils/constants.dart';

class AppSettings extends ChangeNotifier {

  final SharedPreferences _pref;

  AppSettings(this._pref);

  bool get isDarkMode => _pref?.getBool(SharedPreferenceKeys.DARK_MODE) ?? false;

  void setDarkMode(bool val) {
    _pref?.setBool(SharedPreferenceKeys.DARK_MODE, val);
    notifyListeners();
  }

}
