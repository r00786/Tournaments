import 'utils/const.dart';
import 'utils/prefmanager.dart';

class MainDataSource {
  ///checking whether the user is already logged in or not in the cache
  Future<bool> isLoggedIn() async {
    PrefManager prefManager = await PrefManager.instance.getPrefs();
    return prefManager.getBool(IS_LOGIN_SUCCESS);
  }
}
