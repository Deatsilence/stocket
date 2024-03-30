import 'package:flutter/material.dart';

/// [Locales] Project locale enum for operation and configuration
enum Locales {
  /// Turkish locale
  tr(locale: Locale('tr', 'TR')),

  /// English locale
  en(locale: Locale('en', 'US'));

  /// Constructor method
  const Locales({required this.locale});

  /// Locale value
  final Locale locale;
}
