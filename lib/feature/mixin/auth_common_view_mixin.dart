import 'package:flutter/material.dart';

/// [AuthCommonViewMixin] is a [State] mixin that contains the login view logic.
mixin AuthCommonViewMixin<T extends StatefulWidget> on State<T> {
  /// [_loginFormKey] is the key for the login form.
  late final GlobalKey<FormState> _loginFormKey;

  /// [_emailController] is the controller for the email text field.
  late final TextEditingController _emailController;

  /// [_passwordController] is the controller for the password text field.
  late final TextEditingController _passwordController;

  /// [loginFormKey] is the key for the login form.
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  /// [emailController] is the controller for the email text field.
  TextEditingController get emailController => _emailController;

  /// [passwordController] is the controller for the password text field.
  TextEditingController get passwordController => _passwordController;

  @override
  void initState() {
    super.initState();
    _loginFormKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
