import 'package:auto_route/auto_route.dart';
import 'package:stocket/feature/view/auth/login_view.dart';
import 'package:stocket/feature/view/auth/signup_view.dart';
import 'package:stocket/feature/view/auth/sample_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceInRouteName)
final class AppRouter extends _$AppRouter {
  static const _replaceInRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(page: SignUpRoute.page),
      ];
}
