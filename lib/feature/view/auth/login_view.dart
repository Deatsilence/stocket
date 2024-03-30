import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_title.dart';

/// [LoginView] is a [StatefulWidget] that displays the sign up view.
final class LoginView extends StatefulWidget {
  /// Constructor
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with AuthCommonViewMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: BaseView(
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              const AuthTitle(
                titleText: 'Login',
              ),
              CustomTextFormField(
                controller: emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                controller: passwordController,
                prefixIcon: const Icon(Icons.lock_outline),
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
          ),
        ),
      ),
    );
  }
}
