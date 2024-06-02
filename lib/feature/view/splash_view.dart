import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stocket/feature/mixin/splash_view_mixin.dart';

@RoutePage()
final class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
