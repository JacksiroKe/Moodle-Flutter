import 'dart:async';
import 'dart:convert';

import 'package:moodle_flutter/models/User.dart';
import 'package:moodle_flutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferenceKeys.IS_USER_LOGGED_IN);
  }

  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(SharedPreferenceKeys.IS_USER_LOGGED_IN, isLoggedIn);
  }

  static Future<User> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User.fromJson(
        json.decode(prefs.getString(SharedPreferenceKeys.APP_USER)));
  }

  static Future<void> setUserProfile(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(user);
    return prefs.setString(SharedPreferenceKeys.APP_USER, userProfileJson);
  }

  static Future<String> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(SharedPreferenceKeys.USER_TOKEN));
  }

  static Future<void> setUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userTokenJson = json.encode(token);
    return prefs.setString(SharedPreferenceKeys.USER_TOKEN, userTokenJson);
  }

  static Future<String> getSiteName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(SharedPreferenceKeys.SITE_NAME));
  }

  static Future<void> setSiteName(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String siteNameJson = json.encode(token);
    return prefs.setString(SharedPreferenceKeys.SITE_NAME, siteNameJson);
  }

  static Future<String> getSiteUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(SharedPreferenceKeys.SITE_NAME));
  }

  static Future<void> setSiteUrl(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String siteUrlJson = json.encode(token);
    return prefs.setString(SharedPreferenceKeys.SITE_NAME, siteUrlJson);
  }

}
