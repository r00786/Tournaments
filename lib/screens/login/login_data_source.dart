import 'package:tournaments/utils/PrefManager.dart';
import 'package:tournaments/utils/const.dart';

///Data Source for login screen
class LoginDataSource {
  final loginsAvailable = {"username": "rohit", "password": "rohit@123"};

  ///fetching the user selected language from cache
  Future<String> getSelectedLanguage() async {
    PrefManager prefManager = await PrefManager.instance.getPrefs();
    return prefManager.getString(SAVED_LANG, "en-UK");
  }

  ///setting newly selected language in cache
  ///@lang is the language to be saved
  Future<void> setLanguage(String lang) async {
    PrefManager prefManager = await PrefManager.instance.getPrefs();
    return prefManager.putString(SAVED_LANG, lang);
  }

  ///checking for available logins and returning true or false
  ///@username is the username and @password is the password to check
  bool login(String userName, String password) {
    return loginsAvailable["username"] == userName &&
        loginsAvailable["password"] == password;
  }

  ///setting login status in cache
  ///@isLoginSuccess denotes whether the user is logged in or not
  Future<void> setLoginStatus(bool isLoginSuccess) async {
    PrefManager prefManager = await PrefManager.instance.getPrefs();
    return prefManager.putBool(IS_LOGIN_SUCCESS, isLoginSuccess);
  }

  ///checking whether the user is already logged in or not in the cache
  Future<bool> isLoggedIn() async {
    PrefManager prefManager = await PrefManager.instance.getPrefs();
    return prefManager.getBool(IS_LOGIN_SUCCESS);
  }
}
