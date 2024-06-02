import 'package:common/src/constants/border_radius/border_radius_manager.dart';
import 'package:common/src/constants/padding/padding_manager.dart';
import 'package:flutter/material.dart';

/// This is general input decoration for the project
final class CustomInputDecoration extends InputDecoration {
  /// [borderColor] is active border color
  final Color borderColor;

  /// [enableBorderColor] is enable border color
  final Color enableBorderColor;

  /// [deActiveBorderColor] is deactive border color
  final Color deActiveBorderColor;

  /// [errorBorderColor] is error border color
  final Color errorBorderColor;

  /// [isFilled]
  final bool? isFilled;

  /// [backgroundfillColor] is fill color
  final Color? backgroundfillColor;

  /// [_maxHeightOfBoxConstraints] is max height of box constraints
  static const double _maxHeightOfBoxConstraints = 70;

  /// [_borderSideWidth] is border side width
  static const double _borderSideWidth = 2;

  /// The [CustomInputDecoration] class is extending the [InputDecoration]
  /// class from the
  /// `flutter/material.dart` package. The [CustomInputDecoration] class
  /// has a constructor that takes a
  /// named parameter `labelText` and passes it to the `super` constructor of
  /// the [InputDecoration]
  /// class.
  CustomInputDecoration({
    required BuildContext context,
    required this.borderColor,
    required this.enableBorderColor,
    required this.deActiveBorderColor,
    required this.errorBorderColor,
    this.isFilled,
    this.backgroundfillColor,
    super.hintText,
    super.labelText,
    super.prefixIcon,
    super.suffixIcon,
  }) : super(
          filled: isFilled ?? true,
          fillColor: backgroundfillColor ?? Theme.of(context).colorScheme.onPrimary,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          constraints: const BoxConstraints(
            maxHeight: _maxHeightOfBoxConstraints,
            minHeight: _maxHeightOfBoxConstraints,
          ),
          contentPadding: PaddingManager.paddingManagerMorePaddingSymmetricHorizontal,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusManager.normalBorderRadius,
            borderSide: BorderSide(
              color: deActiveBorderColor,
              width: _borderSideWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusManager.normalBorderRadius,
            borderSide: BorderSide(
              color: enableBorderColor,
              width: _borderSideWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadiusManager.normalBorderRadius,
            borderSide: BorderSide(
              color: borderColor,
              width: _borderSideWidth,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadiusManager.normalBorderRadius,
            borderSide: BorderSide(
              color: deActiveBorderColor,
              width: _borderSideWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadiusManager.normalBorderRadius,
            borderSide: BorderSide(
              color: errorBorderColor,
              width: _borderSideWidth,
            ),
          ),
        );
}
