import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_title.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';

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
                titleText: LocaleKeys.authentication_login,
              ),
              CustomTextFormField(
                controller: emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: LocaleKeys.authentication_email.tr(),
                hintText: LocaleKeys.authentication_email_placeholder.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                controller: passwordController,
                prefixIcon: const Icon(Icons.lock_outline),
                labelText: LocaleKeys.authentication_password.tr(),
                hintText: LocaleKeys.authentication_password_placeholder.tr(),
                obscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(LocaleKeys.authentication_forgot_password).tr(),
                ),
              ),
              Padding(
                padding: PaddingManager.paddingManagerNormalPaddingSymmetricVertical,
                child: CustomElevatedButton(
                  onPressed: () {},
                  child: const Text(LocaleKeys.authentication_login).tr(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(LocaleKeys.authentication_dont_have_account).tr(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(LocaleKeys.authentication_sign_up).tr(),
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
