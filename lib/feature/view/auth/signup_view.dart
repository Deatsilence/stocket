import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/mixin/signup_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_title.dart';

/// [SignUpView] is a [StatefulWidget] that displays the sign up view.
final class SignUpView extends StatefulWidget {
  /// Constructor
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with AuthCommonViewMixin, SignUpViewMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: BaseView(
        isAppBarActive: false,
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              const AuthTitle(
                titleText: 'Sign Up',
              ),
              CustomTextFormField(
                controller: nameController,
                prefixIcon: const Icon(Icons.person_outlined),
                labelText: 'Name',
                hintText: 'Enter your name',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                controller: surnameController,
                prefixIcon: const Icon(Icons.person_outlined),
                labelText: 'Surname',
                hintText: 'Enter your surname',
                keyboardType: TextInputType.emailAddress,
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
                prefixIcon: const Icon(Icons.password_outlined),
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
              ),
              CustomTextFormField(
                controller: confirmPasswordController,
                prefixIcon: const Icon(Icons.lock_outlined),
                labelText: 'Confirm Password',
                hintText: 'Enter your confirm password',
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
