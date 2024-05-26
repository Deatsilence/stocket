import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view_model/login_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/navigation/app_router.dart';

/// [LoginViewMixin] is a [State] mixin that contains the login view logic.
mixin LoginViewMixin<T extends StatefulWidget> on State<T> {
  /// [_loginFormKey] is the key for the login form.
  late final GlobalKey<FormState> _loginFormKey;

  /// [_loginViewModel] is the view model for the login view.
  late final LoginViewModel _loginViewModel;

  /// [loginFormKey] is the key for the login form.
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  /// [loginViewModel] is the view model for the login view.
  LoginViewModel get loginViewModel => _loginViewModel;

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

  Future<void> loginOnPressed() async {
    final user = User(
      email: 'mert_im2000@hotmail.com',
      password: 'Sylar3120.',
    );
    await loginViewModel.login(user: user).then(
      (value) async {
        if (value.isSuccess) {
          final rootViewModel = context.read<RootViewModel>();
          rootViewModel.setCurrentUser(user: value.data! as User);

          await context.router.pushAndPopUntil(
            DashboardRootRoute(),
            predicate: (route) => route.settings.name == LoginRoute.name,
          );
        } else {
          null;
        }
      },
    );

    // TODO: Alert Dialog will be come instead of null
  }
}
