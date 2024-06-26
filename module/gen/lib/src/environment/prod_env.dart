import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'prod_env.g.dart';

@Envied(
  obfuscate: true,
  path: 'assets/env/.prod.env',
)

/// [ProdEnv] is a class that is used to get the environment variables.
final class ProdEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _ProdEnv._baseUrl;

  @EnviedField(varName: 'POST_USERS_SIGNUP_DOMAIN')
  static final String _postUsersSignupDomain = _ProdEnv._postUsersSignupDomain;

  @EnviedField(varName: 'POST_USERS_LOGIN_DOMAIN')
  static final String _postUsersLoginDomain = _ProdEnv._postUsersLoginDomain;

  @EnviedField(varName: 'GET_USERS_DOMAIN')
  static final String _getUsersDomain = _ProdEnv._getUsersDomain;

  @EnviedField(varName: 'GET_USERS_BY_ID_DOMAIN')
  static final String _getUsersByIdDomain = _ProdEnv._getUsersByIdDomain;

  @EnviedField(varName: 'POST_PRODUCTS_ADD_DOMAIN')
  static final String _postProductsAddDomain = _ProdEnv._postProductsAddDomain;

  @EnviedField(varName: 'GET_PRODUCTS_DOMAIN')
  static final String _getProductsDomain = _ProdEnv._getProductsDomain;

  @EnviedField(varName: 'GET_PRODUCTS_BY_ID_DOMAIN')
  static final String _getProductsByIdDomain = _ProdEnv._getProductsByIdDomain;

  @EnviedField(varName: 'GET_PRODUCTS_SEARCH_BY_BARCODE')
  static final String _getSearchByBarcodeDomain = _ProdEnv._getSearchByBarcodeDomain;

  @EnviedField(varName: 'DELETE_PRODUCTS_BY_ID_DOMAIN')
  static final String _deleteProductsByIdDomain = _ProdEnv._deleteProductsByIdDomain;

  @EnviedField(varName: 'PUT_PRODUCTS_BY_ID_DOMAIN')
  static final String _putProductsByIdDomain = _ProdEnv._putProductsByIdDomain;

  @EnviedField(varName: 'PATCH_PRODUCTS_BY_ID_DOMAIN')
  static final String _patchProductsByIdDomain = _ProdEnv._patchProductsByIdDomain;

  @EnviedField(varName: 'POST_LOGOUT_DOMAIN')
  static final String _postLogoutDomain = _ProdEnv._postLogoutDomain;

  @EnviedField(varName: 'POST_REQUEST_RESET_PASSWORD_DOMAIN')
  static final String _postRequestResetPasswordDomain =
      _ProdEnv._postRequestResetPasswordDomain;

  @EnviedField(varName: 'POST_REQUEST_CHANGE_PASSWORD_DOMAIN')
  static final String _postChangePasswordDomain = _ProdEnv._postChangePasswordDomain;

  @EnviedField(varName: 'POST_RESET_PASSWORD_DOMAIN')
  static final String _postResetPasswordDomain = _ProdEnv._postResetPasswordDomain;

  @EnviedField(varName: 'POST_VERIFY_EMAIL_DOMAIN')
  static final String _postVerifyEmailDomain = _ProdEnv._postVerifyEmailDomain;

  @EnviedField(varName: 'POST_SEND_VERIFICATION_CODE_TO_EMAIL_DOMAIN')
  static final String _postSendVerificationCodeToEmailDomain =
      _ProdEnv._postSendVerificationCodeToEmailDomain;

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
  String get getProductsByIdDomain => _getProductsByIdDomain;

  @override
  String get getSearchByBarcodeDomain => _getSearchByBarcodeDomain;

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
