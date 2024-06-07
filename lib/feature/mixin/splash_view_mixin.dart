
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/feature/view/splash_view.dart';
import 'package:stocket/feature/view/widget/custom_snackbar.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/feature/view_model/splash_view_model.dart';
import 'package:stocket/feature/view_model/splash_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/constants/enums/response_type.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

mixin SplashViewMixin on State<SplashView> {
  late final SplashViewModel _splashViewModel;

  /// [splashViewModel] is the view model for the splash view.
  SplashViewModel get splashViewModel => _splashViewModel;

  @override
  void initState() {
    super.initState();
    _splashViewModel = SplashViewModel();
    _getDataOfUserFromCache(context: context);
  }

  Future<void> _getDataOfUserFromCache({required BuildContext context}) async {
    final rootViewModel = context.read<RootViewModel>();

    await rootViewModel.checkSignIn();
    final isLogin = rootViewModel.state.isLogin;
    if (isLogin) {
      final result = await rootViewModel.getDataOfUserFromCache();

      rootViewModel.setCurrentUser(user: result.user);
      rootViewModel.setLogin(login: result.login);

      final userlogin = User(
        email: result.user?.email,
        password: result.login?.password,
      );

      await loginWithCache(context: context, user: userlogin);
    } else {
      await context.router.replace(const AuthRootRoute());
    }
  }

  Future<void> loginWithCache({required BuildContext context, User? user}) async {
    if (user.hasValue) {
      final response = await splashViewModel.loginWithCache(user: user!);

      if (response.isSuccess) {
        Logger().i('Login with cache success');
        await context.router.replace(const DashboardRootRoute());
      } else {
        await context.router.replace(const AuthRootRoute()).whenComplete(
          () {
            if (mounted) {
              CustomSnackbar.show(
                context: context,
                message: LocaleKeys.errors_occur_an_error_while_login_with_cache,
                responseType: ResponseType.error,
                second: DurationSeconds.medium,
              );
            }
          },
        );
      }
    }
  }
}
