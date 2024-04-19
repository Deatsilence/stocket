import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/mixin/login_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';

/// [LoginView] is a [StatefulWidget] that displays the sign up view.
@RoutePage()
final class LoginView extends StatefulWidget {
  /// Constructor
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin, AuthCommonViewMixin {
  double _expandedHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    log('LoginView build');
    log('Base URL: ${DevEnv().baseUrl}');
    log('SIGNUP URL: ${DevEnv().postUsersSignupDomain}');
    return BlocProvider(
      create: (context) => loginViewModel,
      child: Form(
        key: loginFormKey,
        child: BaseView(
          sliverAppBar: SliverAppBar(
            pinned: false,
            expandedHeight: _expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: CurvedImage(
                image: Assets.icons.icLoginLogistic.svg(
                  fit: BoxFit.fill,
                  package: 'gen',
                ),
              ),
            ),
          ),
          onPageBuilder: (context, value) => SliverList(
            delegate: SliverChildListDelegate(
              [
                const AuthLabel(
                  textAlign: TextAlign.start,
                  text: LocaleKeys.authentication_login,
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
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: LocaleKeys.authentication_password.tr(),
                  hintText: LocaleKeys.authentication_password_placeholder.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
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
                      onPressed: () {
                        context.router.push(SignUpRoute());
                      },
                      child: const Text(LocaleKeys.authentication_sign_up).tr(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
