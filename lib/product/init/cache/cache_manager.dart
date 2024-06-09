import 'dart:convert';

import 'package:gen/gen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocket/product/error/shared_not_initialize_exception.dart';
import 'package:stocket/product/init/cache/locale_cache_key.dart';

/// [CacheManager] is the cache manager of the app
final class CacheManager {
  CacheManager._();

  static final CacheManager _instance = CacheManager._();

  /// [instance] is the instance of [CacheManager]
  static CacheManager get instance => _instance;

  SharedPreferences? _sharedPreferences;

  void _checkPreferences() {
    if (_sharedPreferences == null) {
      throw SharedNotInitializeException();
    }
  }

  /// [_init] is the initialization of [CacheManager]
  Future<void> _init() async {
    await SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  /// [checkSignInSP] is the get user data from shared preferences
  Future<bool> checkSignInSP() async {
    await _init();
    _checkPreferences();
    return _sharedPreferences!.getBool(LocaleCacheKey.isSignedIn) ?? false;
  }

  /// [setSignInSP] is the get user data from shared preferences
  Future<bool> setSignInSP({required bool isSignedIn}) async {
    await _init();
    _checkPreferences();
    return _sharedPreferences!.setBool(LocaleCacheKey.isSignedIn, isSignedIn);
  }

  /// [setUserDataToSP] is the get user data from shared preferences
  Future<bool> setUserDataToSP({required User user}) async {
    await _init();
    _checkPreferences();
    final userJson = jsonEncode(user.toJson());
    return _sharedPreferences!.setString(
      LocaleCacheKey.userModel,
      userJson,
    );
  }

  /// [setUserDataToSP] is the get user data from shared preferences
  Future<bool> setLoginDataToSP({required Login login}) async {
    await _init();
    _checkPreferences();
    final loginJson = jsonEncode(login.toJson());
    return _sharedPreferences!.setString(
      LocaleCacheKey.loginData,
      loginJson,
    );
  }

  /// [getUserDataFromSP] is the get user data from shared preferences
  Future<String> getUserDataFromSP() async {
    await _init();
    _checkPreferences();
    final data = _sharedPreferences!.getString(LocaleCacheKey.userModel) ?? '';
    return data;
  }

  /// [getLoginDataFromSP] is the get user data from shared preferences
  Future<String> getLoginDataFromSP() async {
    await _init();
    _checkPreferences();
    final data = _sharedPreferences!.getString(LocaleCacheKey.loginData) ?? '';
    return data;
  }

  /// [clearSP] is the clear shared preferences
  Future<bool> clearSP() async {
    await _init();
    _checkPreferences();
    return _sharedPreferences!.clear();
  }
}
