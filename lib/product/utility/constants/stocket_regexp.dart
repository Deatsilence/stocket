/// [StocketRegExp] is a class that contains all the regular expressions used in the application
final class StocketRegExp {
  /// [emailRegexp] is regexp for email
  RegExp get emailRegexp => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      );

  /// [passwordRegexp] is regexp for password
  RegExp get passwordRegexp => RegExp(
        r"^(?=.{8,})(?=.*[A-Z])(?=.*[0-9])(?=.*[^\w\s])(?=.*[a-zA-Z]{3,})",
      );
}
