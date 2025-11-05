import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBooleen(String key, bool value) {
    print("save booleen $value");
    return pref.setBool(key, value);
  }

  static bool? getBooleen(String key) {
    return pref.getBool(key);
  }

  static Future<void> removeData(String key) async {
    await pref.remove(key);
  }
}

class CachKeys {
  CachKeys._();

  static const String isFirstTime = "isFirstTime";
}
