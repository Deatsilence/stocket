import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// [ListGutter] is extension for list gutter
extension ListGutter on List<Widget> {
  /// [seperate] is function to seperate list with gap
  List<Widget> seperate({double space = 5}) => length <= 1
      ? this
      : sublist(1).fold(
          [first],
          (r, element) => [...r, Gap(space), element],
        );
}
