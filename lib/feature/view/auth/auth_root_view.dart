import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class AuthRootView extends StatelessWidget {
  const AuthRootView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
