import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/mixin/signup_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_title.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';

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
                titleText: LocaleKeys.authentication_sign_up,
              ),
              CustomTextFormField(
                controller: nameController,
                prefixIcon: const Icon(Icons.person_outlined),
                labelText: LocaleKeys.authentication_name.tr(),
                hintText: LocaleKeys.authentication_name_placeholder.tr(),
                keyboardType: TextInputType.name,
              ),
              CustomTextFormField(
                controller: surnameController,
                prefixIcon: const Icon(Icons.person_outlined),
                labelText: LocaleKeys.authentication_surname.tr(),
                hintText: LocaleKeys.authentication_surname_placeholder.tr(),
                keyboardType: TextInputType.name,
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
                prefixIcon: const Icon(Icons.password_outlined),
                labelText: LocaleKeys.authentication_password.tr(),
                hintText: LocaleKeys.authentication_password_placeholder.tr(),
                obscureText: true,
              ),
              CustomTextFormField(
                controller: confirmPasswordController,
                prefixIcon: const Icon(Icons.lock_outlined),
                labelText: LocaleKeys.authentication_confirm_password.tr(),
                hintText: LocaleKeys.authentication_confirm_password_placeholder.tr(),
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
                  child: const Text(LocaleKeys.authentication_sign_up).tr(),
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
