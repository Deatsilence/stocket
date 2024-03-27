import 'package:flutter/material.dart';

/// [CustomOutlinedButton] is custom elevated button
final class CustomOutlinedButton extends StatelessWidget {
  /// Constructor
  const CustomOutlinedButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.height = 50,
    this.width = double.infinity,
  });

  final VoidCallback? onPressed;
  final Widget? child;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        // TODO: This will edit later for in INFD-6
        style: Theme.of(context).outlinedButtonTheme.style,
        child: child,
      ),
    );
  }
}
