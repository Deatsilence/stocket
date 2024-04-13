import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/product/init/application_initialize.dart';
import 'package:stocket/product/init/language/product_localization.dart';
import 'package:stocket/product/init/theme/custom_light_theme.dart';
import 'package:stocket/product/navigation/app_router.dart';

Future<void> main() async {
  await ApplicationInitialize().make();

  runApp(ProductLocalization(child: const Stocket()));
}

/// [Stocket] is the root widget of the application.
final class Stocket extends StatelessWidget {
  /// Constructor
  const Stocket({super.key});
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Stocket',
        theme: CustomLightTheme().themeData,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
