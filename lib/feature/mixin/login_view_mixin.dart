import 'package:flutter/material.dart';
import 'package:stocket/feature/view_model/login_view_model.dart';

/// [LoginViewMixin] is a [State] mixin that contains the login view logic.
mixin LoginViewMixin<T extends StatefulWidget> on State<T> {
  /// [_loginFormKey] is the key for the login form.
  late final GlobalKey<FormState> _loginFormKey;

  /// [_loginViewModel] is the view model for the login view.
  late final LoginViewModel _loginViewModel;

  /// [loginViewModel] is the view model for the login view.
  LoginViewModel get loginViewModel => _loginViewModel;

  /// [loginFormKey] is the key for the login form.
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  @override
  void initState() {
    super.initState();
    _loginFormKey = GlobalKey<FormState>();
    _loginViewModel = LoginViewModel();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
