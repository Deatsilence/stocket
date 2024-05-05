import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';

@RoutePage()
final class DashboardRootView extends StatelessWidget {
  const DashboardRootView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
