import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


///Class to handle all the tasks related to shared Prefs or cache
class PrefManager {
  PrefManager._privateConstructor();

  static final PrefManager instance = PrefManager._privateConstructor();

  SharedPreferences prefs;

  Future<PrefManager> getPrefs() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    return this;
  }

// read
  int getInt(String key) => prefs.getInt(key) ?? 0;

//write
  writeInt(String key, int value) => prefs.setInt(key, value);

  // read
  bool getBool(String key) => prefs.getBool(key) ?? false;

//write
  putBool(String key, bool value) => prefs.setBool(key, value);

  // read
  String getString(String key, String defVal) => prefs.getString(key) ?? defVal;

//write
  putString(String key, String value) => prefs.setString(key, value);

  putObj(String key, Map<String, dynamic> map) {
    if (map == null) {
      prefs.setString(key, null);
    } else {
      prefs.setString(key, jsonEncode(map));
    }
  }

  Map<String, dynamic> getObjMap(String key) {
    return jsonDecode(prefs.getString(key));
  }
}
