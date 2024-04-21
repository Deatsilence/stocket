// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthRootView(),
      );
    },
    DashboardRootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardRootView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpView(),
      );
    },
    VerifyOTPRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyOTPRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyOTPView(
          key: args.key,
          email: args.email,
        ),
      );
    },
  };
}

/// generated route for
/// [AuthRootView]
class AuthRootRoute extends PageRouteInfo<void> {
  const AuthRootRoute({List<PageRouteInfo>? children})
      : super(
          AuthRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardRootView]
class DashboardRootRoute extends PageRouteInfo<void> {
  const DashboardRootRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpView]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyOTPView]
class VerifyOTPRoute extends PageRouteInfo<VerifyOTPRouteArgs> {
  VerifyOTPRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyOTPRoute.name,
          args: VerifyOTPRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyOTPRoute';

  static const PageInfo<VerifyOTPRouteArgs> page =
      PageInfo<VerifyOTPRouteArgs>(name);
}

class VerifyOTPRouteArgs {
  const VerifyOTPRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyOTPRouteArgs{key: $key, email: $email}';
  }
}
