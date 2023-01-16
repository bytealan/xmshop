import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Storage {
  static setData(String key, dynamic value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static getData(String key) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String? temp = prefs.getString(key);
      return temp != null ? json.decode(temp) : null;
    } catch (e) {
      return null;
    }
  }

  static removeData(String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clear() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
