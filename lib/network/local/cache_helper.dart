import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ///put data
  static Future<bool> putBooleanData(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  ///get data
  static bool? getBooleanData(
      {required String key}) {
    return  sharedPreferences!.getBool(key);
  }
}
