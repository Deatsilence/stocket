import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class DashboardRootView extends StatelessWidget {
  const DashboardRootView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
