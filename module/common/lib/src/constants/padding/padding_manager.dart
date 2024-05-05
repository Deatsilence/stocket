import 'package:flutter/material.dart';

/// This is padding manager
@immutable
final class PaddingManager {
  /// All Paddings will be here

  /// [paddingManagerLessPaddingAll] is padding for normal as `10`
  static const EdgeInsets paddingManagerLessPaddingAll = EdgeInsets.all(8);

  /// [paddingManagerNormalPaddingAll] is padding for normal as `10`
  static const EdgeInsets paddingManagerNormalPaddingAll = EdgeInsets.all(10);

  /// [paddingManagerMorePaddingAll] is padding for more as `20`
  static const EdgeInsets paddingManagerMorePaddingAll = EdgeInsets.all(20);

  /// Symmetrical Paddings will be here

  /// [paddingManagerNormalPaddingSymmetricHorizontal] is padding for normal
  /// as `10`
  static const EdgeInsets paddingManagerNormalPaddingSymmetricHorizontal =
      EdgeInsets.symmetric(horizontal: 10);

  /// [paddingManagerMorePaddingSymmetricHorizontal] is padding for more as `20`
  static const EdgeInsets paddingManagerMorePaddingSymmetricHorizontal =
      EdgeInsets.symmetric(horizontal: 20);

  /// [paddingManagerNormalPaddingSymmetricVertical] is padding for normal
  ///  as `10`
  static const EdgeInsets paddingManagerNormalPaddingSymmetricVertical =
      EdgeInsets.symmetric(vertical: 10);

  /// [paddingManagerMorePaddingSymmetricVertical] is padding for more as `20`
  static const EdgeInsets paddingManagerMorePaddingSymmetricVertical =
      EdgeInsets.symmetric(vertical: 20);

  /// Constant Paddings will be here
  static const double paddingManagerNormalPadding = 10;
  static const double paddingManagerMorePadding = 20;
}
