import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/utility/constants/stocket_regexp.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

/// [AuthCommonViewMixin] is a [State] mixin that contains the login view logic.
mixin AuthCommonViewMixin<T extends StatefulWidget> on State<T> {
  /// [_emailController] is the controller for the email text field.
  late final TextEditingController _emailController;

  /// [_passwordController] is the controller for the password text field.
  late final TextEditingController _passwordController;

  /// [emailController] is the controller for the email text field.
  TextEditingController get emailController => _emailController;

  /// [passwordController] is the controller for the password text field.
  TextEditingController get passwordController => _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// [emailValidator] is validator for email field
  String? emailValidator(String? value) =>
      value.hasValue && StocketRegExp().emailRegexp.hasMatch(value!)
          ? null
          : LocaleKeys.authentication_email_required.tr();

  /// [passwordValidator] is validator for password field
  String? passwordValidator(String? value) =>
      value.hasValue && StocketRegExp().passwordRegexp.hasMatch(value!)
          ? null
          : LocaleKeys.authentication_password_required.tr();
}
