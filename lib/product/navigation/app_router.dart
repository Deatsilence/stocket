import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/auth/auth_root_view.dart';
import 'package:stocket/feature/view/auth/login_view.dart';
import 'package:stocket/feature/view/auth/send_code_to_email_view.dart';
import 'package:stocket/feature/view/auth/signup_view.dart';
import 'package:stocket/feature/view/auth/verify_otp_view.dart';
import 'package:stocket/feature/view/barcode_scanner_view.dart';
import 'package:stocket/feature/view/dashboard_root_view.dart';
import 'package:stocket/feature/view/home_view.dart';
import 'package:stocket/feature/view/password_reset_view.dart';
import 'package:stocket/feature/view/product_add_view.dart';
import 'package:stocket/product/utility/constants/enums/after_otp_verify.dart';
import 'package:stocket/product/utility/constants/enums/product_view_type.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceInRouteName)
final class AppRouter extends _$AppRouter {
  static const _replaceInRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRootRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: LoginRoute.page,
              initial: true,
            ),
            AutoRoute(page: SignUpRoute.page),
            AutoRoute(page: VerifyOTPRoute.page),
            AutoRoute(page: SendCodeToEMailRoute.page),
            AutoRoute(page: PasswordResetRoute.page),
          ],
        ),
        AutoRoute(
          page: DashboardRootRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: ProductAddRoute.page,
            ),
            AutoRoute(
              page: BarcodeScannerRoute.page,
            ),
          ],
        ),
      ];
}
