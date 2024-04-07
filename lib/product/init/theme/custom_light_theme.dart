import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stocket/product/init/theme/custom_color_scheme.dart';
import 'package:stocket/product/init/theme/custom_theme.dart';

final class CustomLightTheme implements CustomTheme {
  CustomLightTheme() {
    themeData = ThemeData(
        colorScheme: CustomColorScheme.lightColorScheme,
        fontFamily: GoogleFonts.roboto().fontFamily,
        elevatedButtonTheme: elevatedButtonThemeData,
        outlinedButtonTheme: outlinedButtonThemeData);
  }
  @override
  late final ThemeData themeData;

  @override
  final ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColorScheme.lightColorScheme.primary,
      foregroundColor: CustomColorScheme.lightColorScheme.onPrimary,
      disabledBackgroundColor: CustomColorScheme.lightColorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusManager.normalBorderRadius,
      ),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    ),
  );

  /// [outlinedButtonThemeData] is theme data for outlined button light theme
  final OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: CustomColorScheme.lightColorScheme.onPrimary,
      foregroundColor: CustomColorScheme.lightColorScheme.primary,
      side: BorderSide(
        color: CustomColorScheme.lightColorScheme.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusManager.normalBorderRadius,
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}
