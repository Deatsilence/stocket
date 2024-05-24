import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/constants/enums/response_type.dart';

/// [CustomSnackbar] is a custom snackbar widget. it will be used as general
@immutable
final class CustomSnackbar {
  const CustomSnackbar();

  /// [show] method is used to show the snackbar.
  static void show({
    required BuildContext context,
    required String message,
    DurationSeconds second = DurationSeconds.short,
    ResponseType responseType = ResponseType.success,
  }) {
    final colors = _getSnackbarColors(context, responseType);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: second.value),
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              color: colors.text,
            ),
          ),
        ),
        backgroundColor: colors.background,
      ),
    );
  }

  /// Method to get the background and text color based on the response type
  static _SnackbarColors _getSnackbarColors(BuildContext context, ResponseType type) {
    final theme = Theme.of(context);

    switch (type) {
      case ResponseType.success:
        return _SnackbarColors(
          background: ColorName.success,
          text: theme.colorScheme.onSecondary,
        );
      case ResponseType.error:
        return _SnackbarColors(
          background: ColorName.error,
          text: theme.colorScheme.onSecondary,
        );
      case ResponseType.warning:
        return _SnackbarColors(
          background: ColorName.warning,
          text: theme.colorScheme.onSecondary,
        );
      case ResponseType.info:
        return _SnackbarColors(
          background: ColorName.info,
          text: theme.colorScheme.onSecondary,
        );
      default:
        return _SnackbarColors(
          background: ColorName.info,
          text: theme.colorScheme.onSecondary,
        );
    }
  }
}

/// Class to hold snackbar colors
@immutable
final class _SnackbarColors {
  _SnackbarColors({required this.background, required this.text});

  final Color background;
  final Color text;
}
