import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'dev_env.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.dev.env',
)

/// [DevEnv] is a class that is used to get the environment variables.
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @EnviedField(varName: 'POST_USERS_SIGNUP_DOMAIN')
  static final String _postUsersSignupDomain = _DevEnv._postUsersSignupDomain;

  @EnviedField(varName: 'POST_USERS_LOGIN_DOMAIN')
  static final String _postUsersLoginDomain = _DevEnv._postUsersLoginDomain;

  @EnviedField(varName: 'GET_USERS_DOMAIN')
  static final String _getUsersDomain = _DevEnv._getUsersDomain;

  @EnviedField(varName: 'GET_USERS_BY_ID_DOMAIN')
  static final String _getUsersByIdDomain = _DevEnv._getUsersByIdDomain;

  @EnviedField(varName: 'POST_PRODUCTS_ADD_DOMAIN')
  static final String _postProductsAddDomain = _DevEnv._postProductsAddDomain;

  @EnviedField(varName: 'GET_PRODUCTS_DOMAIN')
  static final String _getProductsDomain = _DevEnv._getProductsDomain;

  @EnviedField(varName: 'GET_PRODUCTS_BY_ID_DOMAIN')
  static final String _getProductsByIdDomain = _DevEnv._getProductsByIdDomain;

  @EnviedField(varName: 'GET_PRODUCTS_SEARCH_BY_BARCODE')
  static final String _getSearchByBarcodeDomain = _DevEnv._getSearchByBarcodeDomain;

  @EnviedField(varName: 'DELETE_PRODUCTS_BY_ID_DOMAIN')
  static final String _deleteProductsByIdDomain = _DevEnv._deleteProductsByIdDomain;

  @EnviedField(varName: 'PUT_PRODUCTS_BY_ID_DOMAIN')
  static final String _putProductsByIdDomain = _DevEnv._putProductsByIdDomain;

  @EnviedField(varName: 'PATCH_PRODUCTS_BY_ID_DOMAIN')
  static final String _patchProductsByIdDomain = _DevEnv._patchProductsByIdDomain;

  @EnviedField(varName: 'POST_LOGOUT_DOMAIN')
  static final String _postLogoutDomain = _DevEnv._postLogoutDomain;

  @EnviedField(varName: 'POST_REQUEST_RESET_PASSWORD_DOMAIN')
  static final String _postRequestResetPasswordDomain =
      _DevEnv._postRequestResetPasswordDomain;

  @EnviedField(varName: 'POST_REQUEST_CHANGE_PASSWORD_DOMAIN')
  static final String _postChangePasswordDomain = _DevEnv._postChangePasswordDomain;

  @EnviedField(varName: 'POST_RESET_PASSWORD_DOMAIN')
  static final String _postResetPasswordDomain = _DevEnv._postResetPasswordDomain;

  @EnviedField(varName: 'POST_VERIFY_EMAIL_DOMAIN')
  static final String _postVerifyEmailDomain = _DevEnv._postVerifyEmailDomain;

  @EnviedField(varName: 'POST_SEND_VERIFICATION_CODE_TO_EMAIL_DOMAIN')
  static final String _postSendVerificationCodeToEmailDomain =
      _DevEnv._postSendVerificationCodeToEmailDomain;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get postUsersSignupDomain => _postUsersSignupDomain;

  @override
  String get postUsersLoginDomain => _postUsersLoginDomain;

  @override
  String get getUsersDomain => _getUsersDomain;

  @override
  String get getUsersByIdDomain => _getUsersByIdDomain;

  @override
  String get postProductsAddDomain => _postProductsAddDomain;

  @override
  String get getProductsDomain => _getProductsDomain;

  @override
  String get getSearchByBarcodeDomain => _getSearchByBarcodeDomain;

  @override
  String get getProductsByIdDomain => _getProductsByIdDomain;

  @override
  String get deleteProductsByIdDomain => _deleteProductsByIdDomain;

  @override
  String get putProductsByIdDomain => _putProductsByIdDomain;

  @override
  String get patchProductsByIdDomain => _patchProductsByIdDomain;

  @override
  String get postLogoutDomain => _postLogoutDomain;

  @override
  String get postRequestResetPasswordDomain => _postRequestResetPasswordDomain;

  @override
  String get postChangePasswordDomain => _postChangePasswordDomain;

  @override
  String get postResetPasswordDomain => _postResetPasswordDomain;

  @override
  String get postVerifyEmailDomain => _postVerifyEmailDomain;

  @override
  String get postSendVerificationCodeToEmailDomain =>
      _postSendVerificationCodeToEmailDomain;
}
