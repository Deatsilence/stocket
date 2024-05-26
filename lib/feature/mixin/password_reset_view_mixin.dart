import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view_model/password_reset_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

/// [PasswordResetViewMixin] is a [State] mixin that contains the login view logic.
mixin PasswordResetViewMixin<T extends StatefulWidget> on State<T> {
  /// [_passwordResetFormKey] is the key for the login form.
  late final GlobalKey<FormState> _passwordResetFormKey;

  /// [_passwordResetViewModel] is the view model for the login view.
  late final PasswordResetViewModel _passwordResetViewModel;

  /// [_confirmPasswordController] is the controller for the email text field.
  late final TextEditingController _confirmPasswordController;

  /// [loginFormKey] is the key for the login form.
  GlobalKey<FormState> get passwordResetFormKey => _passwordResetFormKey;

  /// [loginViewModel] is the view model for the login view.
  PasswordResetViewModel get passwordResetViewModel => _passwordResetViewModel;

  /// [confirmPasswordController] is the controller for the email text field.
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordResetFormKey = GlobalKey<FormState>();
    _passwordResetViewModel = PasswordResetViewModel();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// [confirmPasswordValidator] is validator for confirm password field
  String? confirmPasswordValidator(String? value, String password) =>
      value.hasValue && value == password
          ? null
          : LocaleKeys.authentication_password_confirmed.tr();

  Future<void> onPressed({
    required BuildContext context,
    required VerifyOTP verifyOTP,
  }) async {
    var currentState = passwordResetFormKey.currentState;
    if (currentState.hasValue && currentState!.validate()) {
      currentState.save();
      final resetPassword = ResetPassword(
        verifyOTP: verifyOTP,
        newPassword: confirmPasswordController.text,
      );
      await passwordResetViewModel.resetPassword(resetPassword: resetPassword);
    }
  }
}
