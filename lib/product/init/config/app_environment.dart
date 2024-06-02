import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

/// [AppEnvironment] is manager of environment.
final class AppEnvironment {
  /// [AppEnvironment.general] gets as automatically the environment
  AppEnvironment.general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }

  /// [AppEnvironment.setup] sets a spesific environment
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  static late final AppConfiguration _config;
}

// /// [AppEnvironmentItems] gets the environment variables.
// enum AppEnvironmentItems {
//   /// [baseUrl] is the base url of the application.
//   baseUrl;

//   /// [value] is the value of the environment variable.
//   String get value {
//     try {
//       switch (this) {
//         case AppEnvironmentItems.baseUrl:
//           return AppEnvironment._config.baseUrl;
//       }
//     } catch (e) {
//       throw Exception('Environment variable is not found. ');
//     }
//   }
// }
