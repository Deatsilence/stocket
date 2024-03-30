import 'package:flutter/material.dart';

/// This is padding manager
@immutable
final class PaddingManager {
  // TODO: All Paddings

  /// [paddingManagerLessPaddingAll] is padding for normal as `10`
  static const EdgeInsets paddingManagerLessPaddingAll = EdgeInsets.all(8);

  /// [paddingManagerNormalPaddingAll] is padding for normal as `10`
  static const EdgeInsets paddingManagerNormalPaddingAll = EdgeInsets.all(10);

  /// [paddingManagerMorePaddingAll] is padding for more as `20`
  static const EdgeInsets paddingManagerMorePaddingAll = EdgeInsets.all(20);

  // TODO: Symmetrical Paddings

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
}
