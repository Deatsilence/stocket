import 'package:gen/src/utility/constants/enum/user_type.dart';

/// [UserTypeExtension] is used to define the extension methods for [UserType]
extension UserTypeExtension on UserType {
  /// [name] returns the name of the user type
  String get name {
    switch (this) {
      case UserType.admin:
        return 'ADMIN';
      case UserType.user:
        return 'USER';
    }
  }
}
