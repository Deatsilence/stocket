/// [AppConfiguration] is an abstract class that contains
/// the configuration variables of the application.
abstract class AppConfiguration {
  /// [baseUrl] is the base url of the application.
  String get baseUrl;

  /// [postUsersSignupDomain] is the domain for the post users signup.
  String get postUsersSignupDomain;

  /// [postUsersLoginDomain] is the domain for the post users login.
  String get postUsersLoginDomain;

  /// [getUsersDomain] is the domain for the get users.
  String get getUsersDomain;

  /// [getUsersByIdDomain] is the domain for the get users by id.
  String get getUsersByIdDomain;

  /// [deleteUsersByIdDomain] is the domain for the delete users by id.
  String get postProductsAddDomain;

  /// [putUsersByIdDomain] is the domain for the put users by id.
  String get getProductsDomain;

  /// [patchUsersByIdDomain] is the domain for the patch users by id.
  String get getProductsByIdDomain;

  /// [postLogoutDomain] is the domain for the post logout.
  String get deleteProductsByIdDomain;

  /// [postRequestResetPasswordDomain] is the domain for the post request reset password.
  String get putProductsByIdDomain;

  /// [postResetPasswordDomain] is the domain for the post reset password.
  String get patchProductsByIdDomain;

  /// [postVerifyEmailDomain] is the domain for the post verify email.
  String get postLogoutDomain;

  /// [postSendVerificationCodeToEmailDomain] is the domain for the post send verification code to email.
  String get postRequestResetPasswordDomain;

  /// [postResetPasswordDomain] is the domain for the post reset password.
  String get postResetPasswordDomain;

  /// [postVerifyEmailDomain] is the domain for the post verify email.
  String get postVerifyEmailDomain;

  /// [postSendVerificationCodeToEmailDomain] is the domain for the post send verification code to email.
  String get postSendVerificationCodeToEmailDomain;
}
