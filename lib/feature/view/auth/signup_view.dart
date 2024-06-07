
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/mixin/signup_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view_model/signup_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/state/signup_state.dart';

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
    return BlocProvider<SignUpViewModel>(
      create: (context) => signupViewModel,
      child: Form(
        key: signupFormKey,
        child: Stack(
          children: [
            BaseView(
              sliverAppBar: SliverAppBar(),
              onPageBuilder: (context, value) => SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const AuthLabel(
                      textAlign: TextAlign.start,
                      text: LocaleKeys.authentication_sign_up,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      prefixIcon: const Icon(Icons.person_outlined),
                      labelText: LocaleKeys.authentication_name.tr(),
                      hintText: LocaleKeys.authentication_name_placeholder.tr(),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: nameValidator,
                    ),
                    CustomTextFormField(
                      controller: surnameController,
                      prefixIcon: const Icon(Icons.person_outlined),
                      labelText: LocaleKeys.authentication_surname.tr(),
                      hintText: LocaleKeys.authentication_surname_placeholder.tr(),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: surnameValidator,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelText: LocaleKeys.authentication_email.tr(),
                      hintText: LocaleKeys.authentication_email_placeholder.tr(),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: emailValidator,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      prefixIcon: const Icon(Icons.password_outlined),
                      labelText: LocaleKeys.authentication_password.tr(),
                      hintText: LocaleKeys.authentication_password_placeholder.tr(),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      validator: passwordValidator,
                    ),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      prefixIcon: const Icon(Icons.lock_outlined),
                      labelText: LocaleKeys.authentication_confirm_password.tr(),
                      hintText:
                          LocaleKeys.authentication_confirm_password_placeholder.tr(),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      validator: (value) =>
                          confirmPasswordValidator(value, passwordController.text),
                    ),
                    Padding(
                      padding:
                          PaddingManager.paddingManagerNormalPaddingSymmetricVertical,
                      child: CustomElevatedButton(
                        onPressed: onSignUpPressed,
                        child: const Text(LocaleKeys.authentication_sign_up).tr(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TransparentScreen<SignUpViewModel, SignUpState>(
              child: Assets.lottie.lotLoading.lottie(package: 'gen'),
              selector: (state) => state.isLoading,
            )
          ],
        ),
      ),
    );
  }
}
