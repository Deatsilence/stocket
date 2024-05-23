import 'package:flutter/material.dart';

/// [CustomSnackbar] is a custom snackbar widget. it will be used as general
@immutable
final class CustomSnackbar {
  const CustomSnackbar();

  /// [show] method is used to show the snackbar.
  static void show({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required Color textColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(
          message,
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
