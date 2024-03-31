import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/init/config/app_environment.dart';

/// [ApplicationInitialize] is a class that initializes the application.
@immutable
final class ApplicationInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e('Error: $error');
    });
  }

  /// [_initialize] is a method that initializes the application.
  Future<void> _initialize() async {
    /// Initialize Easy Localization
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    log(Platform.localeName);
    FlutterError.onError = (details) {
      // Logger().e('Flutter Error: ${details.exception}');
      /// crashlytics log instert here
      /// custom service or custom logger insert here
    };

    AppEnvironment.general();
  }
}
