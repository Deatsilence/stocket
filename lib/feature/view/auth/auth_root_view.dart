
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class AuthRootView extends StatefulWidget {
  const AuthRootView({Key? key}) : super(key: key);

  @override
  State<AuthRootView> createState() => _AuthRootViewState();
}

class _AuthRootViewState extends State<AuthRootView> {
  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
