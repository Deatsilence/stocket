import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/mixin/signup_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';

/// [SignUpView] is a [StatefulWidget] that displays the sign up view.
@RoutePage()
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
    log('SignUpView build');
    return Form(
      key: signupFormKey,
      child: BaseView(
        sliverAppBar: SliverAppBar(),
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              const AuthLabel(
                titleText: LocaleKeys.authentication_sign_up,
              ),
              CustomTextFormField(
                controller: nameController,
                prefixIcon: const Icon(Icons.person_outlined),
                labelText: LocaleKeys.authentication_name.tr(),
                hintText: LocaleKeys.authentication_name_placeholder.tr(),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                controller: surnameController,
                prefixIcon: const Icon(Icons.person_outlined),
                labelText: LocaleKeys.authentication_surname.tr(),
                hintText: LocaleKeys.authentication_surname_placeholder.tr(),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                controller: emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: LocaleKeys.authentication_email.tr(),
                hintText: LocaleKeys.authentication_email_placeholder.tr(),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                controller: passwordController,
                prefixIcon: const Icon(Icons.password_outlined),
                labelText: LocaleKeys.authentication_password.tr(),
                hintText: LocaleKeys.authentication_password_placeholder.tr(),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                obscureText: true,
              ),
              CustomTextFormField(
                controller: confirmPasswordController,
                prefixIcon: const Icon(Icons.lock_outlined),
                labelText: LocaleKeys.authentication_confirm_password.tr(),
                hintText: LocaleKeys.authentication_confirm_password_placeholder.tr(),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: true,
              ),
              Padding(
                padding: PaddingManager.paddingManagerNormalPaddingSymmetricVertical,
                child: CustomElevatedButton(
                  onPressed: () {
                    context.router.push(VerifyOTPRoute());
                  },
                  child: const Text(LocaleKeys.authentication_sign_up).tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
