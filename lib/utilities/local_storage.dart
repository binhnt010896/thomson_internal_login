import 'package:shared_preferences/shared_preferences.dart';

const REDIRECT_URL = 'redirect_url';

class Storage {
  static final Storage instance = Storage._internal();
  SharedPreferences? _prefs;

  factory Storage() {
    return instance;
  }

  Storage._internal();

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> saveBoolean(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  bool getBoolean(String key) => _prefs?.getBool(key) ?? false;

  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  Future<void> remove(String key) async {
    _prefs?.remove(key);
  }

  Future<void> clear() async {
    _prefs?.clear();
  }

  String getString(String key) {
    return _prefs?.getString(key) ?? '';
  }

  Future<void> saveInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  int getInt(String key) {
    return _prefs?.getInt(key) ?? -1;
  }

  Future<void> saveDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  Future<double> getDouble(String key) async {
    return _prefs?.getDouble(key) ?? 0;
  }
}

final local = Storage.instance;