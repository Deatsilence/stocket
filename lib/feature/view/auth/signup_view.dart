import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// [SignUpView] is a [StatefulWidget] that displays the sign up view.
final class SignUpView extends StatefulWidget {
  /// Constructor
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      titleText: 'Login',
      formFields: [
        CustomElevatedButton(
          onPressed: () {},
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}
