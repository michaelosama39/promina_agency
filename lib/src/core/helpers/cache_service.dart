import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static late final SharedPreferences _sharedPrefrences;

  static Future<void> init() async {
    _sharedPrefrences = await SharedPreferences.getInstance();
  }

  static void write(String key, dynamic value) {
    if (value is String) {
      _sharedPrefrences.setString(key, value);
    } else if (value is int) {
      _sharedPrefrences.setInt(key, value);
    } else if (value is double) {
      _sharedPrefrences.setDouble(key, value);
    } else if (value is bool) {
      _sharedPrefrences.setBool(key, value);
    } else if (value is List<String>) {
      _sharedPrefrences.setStringList(key, value);
    }
  }

  static dynamic read(String key) {
    return _sharedPrefrences.get(key);
  }

  static dynamic remove(String key) {
    return _sharedPrefrences.remove(key);
  }
}