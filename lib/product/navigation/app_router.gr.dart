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
    BarcodeScannerRoute.name: (routeData) {
      final args = routeData.argsAs<BarcodeScannerRouteArgs>(
          orElse: () => const BarcodeScannerRouteArgs());
      return AutoRoutePage<String>(
        routeData: routeData,
        child: BarcodeScannerView(
          key: args.key,
          onDetect: args.onDetect,
        ),
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
    PasswordResetRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordResetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PasswordResetView(
          key: args.key,
          verifyOTP: args.verifyOTP,
        ),
      );
    },
    ProductAddRoute.name: (routeData) {
      final args = routeData.argsAs<ProductAddRouteArgs>(
          orElse: () => const ProductAddRouteArgs());
      return AutoRoutePage<bool?>(
        routeData: routeData,
        child: ProductAddView(
          key: args.key,
          viewType: args.viewType,
          product: args.product,
        ),
      );
    },
    SendCodeToEMailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SendCodeToEMailView(),
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
          afterOtpVerify: args.afterOtpVerify,
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
/// [BarcodeScannerView]
class BarcodeScannerRoute extends PageRouteInfo<BarcodeScannerRouteArgs> {
  BarcodeScannerRoute({
    Key? key,
    void Function(String)? onDetect,
    List<PageRouteInfo>? children,
  }) : super(
          BarcodeScannerRoute.name,
          args: BarcodeScannerRouteArgs(
            key: key,
            onDetect: onDetect,
          ),
          initialChildren: children,
        );

  static const String name = 'BarcodeScannerRoute';

  static const PageInfo<BarcodeScannerRouteArgs> page =
      PageInfo<BarcodeScannerRouteArgs>(name);
}

class BarcodeScannerRouteArgs {
  const BarcodeScannerRouteArgs({
    this.key,
    this.onDetect,
  });

  final Key? key;

  final void Function(String)? onDetect;

  @override
  String toString() {
    return 'BarcodeScannerRouteArgs{key: $key, onDetect: $onDetect}';
  }
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
/// [PasswordResetView]
class PasswordResetRoute extends PageRouteInfo<PasswordResetRouteArgs> {
  PasswordResetRoute({
    Key? key,
    required VerifyOTP verifyOTP,
    List<PageRouteInfo>? children,
  }) : super(
          PasswordResetRoute.name,
          args: PasswordResetRouteArgs(
            key: key,
            verifyOTP: verifyOTP,
          ),
          initialChildren: children,
        );

  static const String name = 'PasswordResetRoute';

  static const PageInfo<PasswordResetRouteArgs> page =
      PageInfo<PasswordResetRouteArgs>(name);
}

class PasswordResetRouteArgs {
  const PasswordResetRouteArgs({
    this.key,
    required this.verifyOTP,
  });

  final Key? key;

  final VerifyOTP verifyOTP;

  @override
  String toString() {
    return 'PasswordResetRouteArgs{key: $key, verifyOTP: $verifyOTP}';
  }
}

/// generated route for
/// [ProductAddView]
class ProductAddRoute extends PageRouteInfo<ProductAddRouteArgs> {
  ProductAddRoute({
    Key? key,
    ProductViewType viewType = ProductViewType.add,
    Product? product,
    List<PageRouteInfo>? children,
  }) : super(
          ProductAddRoute.name,
          args: ProductAddRouteArgs(
            key: key,
            viewType: viewType,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductAddRoute';

  static const PageInfo<ProductAddRouteArgs> page =
      PageInfo<ProductAddRouteArgs>(name);
}

class ProductAddRouteArgs {
  const ProductAddRouteArgs({
    this.key,
    this.viewType = ProductViewType.add,
    this.product,
  });

  final Key? key;

  final ProductViewType viewType;

  final Product? product;

  @override
  String toString() {
    return 'ProductAddRouteArgs{key: $key, viewType: $viewType, product: $product}';
  }
}

/// generated route for
/// [SendCodeToEMailView]
class SendCodeToEMailRoute extends PageRouteInfo<void> {
  const SendCodeToEMailRoute({List<PageRouteInfo>? children})
      : super(
          SendCodeToEMailRoute.name,
          initialChildren: children,
        );

  static const String name = 'SendCodeToEMailRoute';

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
    AfterOtpVerify afterOtpVerify = AfterOtpVerify.login,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyOTPRoute.name,
          args: VerifyOTPRouteArgs(
            key: key,
            email: email,
            afterOtpVerify: afterOtpVerify,
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
    this.afterOtpVerify = AfterOtpVerify.login,
  });

  final Key? key;

  final String email;

  final AfterOtpVerify afterOtpVerify;

  @override
  String toString() {
    return 'VerifyOTPRouteArgs{key: $key, email: $email, afterOtpVerify: $afterOtpVerify}';
  }
}
