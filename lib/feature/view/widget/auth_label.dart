import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// [AuthLabel] is a [StatelessWidget] that displays the title of the authentication view.
final class AuthLabel extends StatelessWidget {
  /// Constructor
  const AuthLabel({
    required String titleText,
    TextStyle? style,
    TextAlign textAlign = TextAlign.center,
  })  : _titleText = titleText,
        _textAlign = textAlign,
        _style = style;

  /// [_titleText] is the text to display.
  final String _titleText;

  /// [_textAlign] is the alignment of the text.
  final TextAlign _textAlign;

  /// [_style] is the style of the text. If not provided, it will use the default style.
  final TextStyle? _style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingManagerNormalPaddingSymmetricVertical,
      child: Text(
        _titleText,
        textAlign: _textAlign,
        style: _style ??
            Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
      ).tr(),
    );
  }
}
