import 'package:flutter/material.dart';

/// [LocaleCacheKey] is the cache key of locale
@immutable
final class LocaleCacheKey {
  /// [isSignedIn] is the sign in state of user
  static const String isSignedIn = 'is_signed_in';

  /// [userModel] is the user model of user
  static const String userModel = 'user_model';

  /// [loginData] is the login data of user
  static const String loginData = 'login_data';
}
