import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// [AuthTitle] is a [StatelessWidget] that displays the title of the authentication view.
final class AuthTitle extends StatelessWidget {
  /// Constructor
  const AuthTitle({
    required this.titleText,
    super.key,
  });

  /// [titleText] is the text to display.
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingManagerNormalPaddingSymmetricVertical,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
