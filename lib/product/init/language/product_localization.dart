import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stocket/product/utility/constants/enums/locales.dart';

/// [ProductLocalization] is a class that contains all product localizations
@immutable
final class ProductLocalization extends EasyLocalization {
  /// [ProductLocalization] needs to a [child] for a wrap locale item
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
            supportedLocales: _supportedLocales,
            path: _translationPath,
            useOnlyLangCode: true,
            startLocale: _determineStartLocale());

  static final List<Locale> _supportedLocales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR'),
  ];

  static const String _translationPath = 'assets/translations';

  /// [updateLanguage] is a method that updates the language of the application.
  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) async =>
      context.setLocale(value.locale);

  /// [_determineStartLocale] is a method that determines the start locale of the application.
  static Locale _determineStartLocale() {
    String deviceLanguageCode = _getDeviceLanguageCode();
    return _supportedLocales.firstWhere(
      (locale) => locale.languageCode == deviceLanguageCode,
      orElse: () => _supportedLocales.first,
    );
  }

  /// [_getDeviceLanguageCode] is a method that gets the device language code.
  static String _getDeviceLanguageCode() {
    return Platform.localeName.split('_').first;
  }
}
