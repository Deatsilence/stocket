import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        const CustomTextFormField(
          labelText: 'Email',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
        ),
        const CustomTextFormField(
          labelText: 'Password',
          hintText: 'Enter your password',
          obscureText: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text('Forgot Password?'),
          ),
        ),
        Padding(
          padding: PaddingManager.paddingManagerNormalPaddingSymmetricVertical,
          child: CustomElevatedButton(
            onPressed: () {},
            child: const Text('Sign In'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ],
    );
  }
}
