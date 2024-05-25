import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable
final class FlexableLabel extends StatelessWidget {
  const FlexableLabel({
    super.key,
    required this.title,
    this.isStyleActive = true,
  });

  final String title;
  final bool isStyleActive;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isStyleActive
          ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              )
          : null,
    ).tr();
  }
}
