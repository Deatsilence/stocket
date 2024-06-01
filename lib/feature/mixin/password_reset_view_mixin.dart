import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/widget/custom_snackbar.dart';
import 'package:stocket/feature/view_model/password_reset_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/constants/enums/response_type.dart';
import 'package:stocket/product/utility/constants/enums/status_code.dart';
import 'package:stocket/product/utility/constants/stocket_regexp.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';
import 'package:stocket/product/utility/response/api_response.dart';

/// [PasswordResetViewMixin] is a [State] mixin that contains the login view logic.
mixin PasswordResetViewMixin<T extends StatefulWidget> on State<T> {
  /// [_passwordResetFormKey] is the key for the login form.
  late final GlobalKey<FormState> _passwordResetFormKey;

  /// [_passwordResetViewModel] is the view model for the login view.
  late final PasswordResetViewModel _passwordResetViewModel;

  /// [_oldPasswordController] is the controller for the old password text field.
  late final TextEditingController _oldPasswordController;

  /// [_confirmPasswordController] is the controller for the email text field.
  late final TextEditingController _confirmPasswordController;

  /// [loginFormKey] is the key for the login form.
  GlobalKey<FormState> get passwordResetFormKey => _passwordResetFormKey;

  /// [loginViewModel] is the view model for the login view.
  PasswordResetViewModel get passwordResetViewModel => _passwordResetViewModel;

  /// [oldPasswordController] is the controller for the old password text field.
  TextEditingController get oldPasswordController => _oldPasswordController;

  /// [confirmPasswordController] is the controller for the email text field.
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordResetFormKey = GlobalKey<FormState>();
    _passwordResetViewModel = PasswordResetViewModel();
    _oldPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// [passwordValidator] is validator for password field
  String? passwordValidator(String? value) =>
      value.hasValue && StocketRegExp().passwordRegexp.hasMatch(value!)
          ? null
          : LocaleKeys.authentication_password_required.tr();

  /// [confirmPasswordValidator] is validator for confirm password field
  String? confirmPasswordValidator(String? value, String password) =>
      value.hasValue && value == password
          ? null
          : LocaleKeys.authentication_password_confirmed.tr();

  Future<void> onPressed({
    required BuildContext context,
    required bool isLogin,
    required VerifyOTP verifyOTP,
  }) async {
    var currentState = passwordResetFormKey.currentState;
    if (currentState.hasValue && currentState!.validate()) {
      currentState.save();

      late ApiResponse<dynamic> result;

      if (isLogin) {
        log('email: ${verifyOTP.email}');
        final changePassword = ChangePassword(
          email: verifyOTP.email,
          oldPassword: oldPasswordController.text,
          newPassword: confirmPasswordController.text,
        );
        log('changePassword: $changePassword');
        result =
            await passwordResetViewModel.changePassword(changePassword: changePassword);
      } else {
        final resetPassword = ResetPassword(
          verifyOTP: verifyOTP,
          newPassword: confirmPasswordController.text,
        );
        result = await passwordResetViewModel.resetPassword(resetPassword: resetPassword);
      }
      log('onPressed: $result');

      if (result.isSuccess) {
        CustomSnackbar.show(
          context: context,
          message: LocaleKeys.authentication_reset_password_success.tr(),
          second: DurationSeconds.medium,
          responseType: ResponseType.success,
        );
        isLogin ? context.router.maybePop() : context.router.popUntilRoot();
      } else if (result.result == HttpResult.unauthorized) {
        CustomSnackbar.show(
          context: context,
          message: LocaleKeys.authentication_wrong_password.tr(),
          second: DurationSeconds.medium,
          responseType: ResponseType.error,
        );
      } else {
        CustomSnackbar.show(
          context: context,
          message: LocaleKeys.errors_occur_an_error_while_change_password.tr(),
          second: DurationSeconds.medium,
          responseType: ResponseType.warning,
        );
      }
    }
  }
}
