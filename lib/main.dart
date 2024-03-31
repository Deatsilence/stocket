import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stocket/feature/view/auth/login_view.dart';
import 'package:stocket/product/init/application_initialize.dart';
import 'package:stocket/product/init/language/product_localization.dart';

Future<void> main() async {
  await ApplicationInitialize().make();

  runApp(ProductLocalization(child: const MyApp()));
}

/// [MyApp] is the root widget of the application.
final class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stocket',
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
