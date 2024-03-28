import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// [BaseAuthView] is a [StatelessWidget] that displays the base authentication view.
final class BaseAuthView<T> extends StatefulWidget {
  /// Constructor
  const BaseAuthView({
    required this.formFields,
    required this.titleText,
    this.onDispose,
    this.subTitle,
    this.isLogin = true,
    super.key,
  });

  /// [titleText] is the title text of the view.
  final String titleText;

  /// [subTitle] is the subtitle text of the view.
  final String? subTitle;

  /// [formFields] is a list of form fields.
  final List<Widget> formFields;

  /// [isLogin] is a boolean that determines if the view is for login or not.
  final bool isLogin;

  /// [onDispose] is the callback function that is called
  /// when the view is disposed.
  final VoidCallback? onDispose;

  @override
  State<BaseAuthView<T>> createState() => _BaseAuthViewState<T>();
}

class _BaseAuthViewState<T> extends State<BaseAuthView<T>> {
  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: CurvedImage(
                  imagePath: 'https://picsum.photos/200',
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: PaddingManager.paddingManagerNormalPaddingSymmetricHorizontal,
                  child: _AuthBody(widget: widget),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// [_AuthBody] is a [StatelessWidget] that displays the body of the authentication view.
final class _AuthBody extends StatelessWidget {
  const _AuthBody({
    required this.widget,
  });

  final BaseAuthView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.titleText,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ...widget.formFields
      ],
    );
  }
}
