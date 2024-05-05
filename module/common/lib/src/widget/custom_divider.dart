import 'package:common/common.dart';
import 'package:flutter/material.dart';

final class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.text,
  });

  final Text text;

  @override
  Widget build(BuildContext context) {
    double height = 36;

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: PaddingManager.paddingManagerNormalPadding,
              right: PaddingManager.paddingManagerMorePadding,
            ),
            child: Divider(
              color: Theme.of(context).dividerColor,
              height: height,
            ),
          ),
        ),
        text,
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: PaddingManager.paddingManagerMorePadding,
              right: PaddingManager.paddingManagerNormalPadding,
            ),
            child: Divider(
              color: Theme.of(context).dividerColor,
              height: height,
            ),
          ),
        ),
      ],
    );
  }
}
