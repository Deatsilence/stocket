import 'package:flutter/material.dart';

/// [BaseAuthView] is a [StatelessWidget] that displays the base authentication view.
final class BaseAuthView<T> extends StatefulWidget {
  /// Constructor
  const BaseAuthView({
    required this.formFields,
    required this.titleText,
    this.onDispose,
    super.key,
  });

  /// [titleText] is the title text of the view.
  final String titleText;

  /// [formFields] is a list of form fields.
  final List<Widget> formFields;

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
          child: Column(
            children: [
              Text(
                widget.titleText,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ...widget.formFields,
            ],
          ),
        ),
      ),
    );
  }
}
