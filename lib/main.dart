import 'package:flutter/material.dart';
import 'package:stocket/feature/view/auth/login_view.dart';
import 'package:stocket/feature/view/auth/signup_view.dart';

void main() {
  runApp(const MyApp());
}

/// [MyApp] is the root widget of the application.
final class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stocket',
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
