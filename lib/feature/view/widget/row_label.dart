import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/product/utility/extension/list_gutter_extension.dart';

/// [RowLabel] is a [StatelessWidget] that displays the label of the row.
final class RowLabel extends StatelessWidget {
  const RowLabel({
    super.key,
    required this.firstText,
    required this.secondText,
    this.style,
  });

  final String firstText;
  final String secondText;
  final TextStyle? style;

  static const String _seperator = ": ";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: style,
        ),
        Text(_seperator),
        Text(
          secondText,
          style: style,
        ),
      ].seperate(space: 0.4.h),
    );
  }
}
