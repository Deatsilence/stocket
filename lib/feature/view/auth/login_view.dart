import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/mixin/login_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view_model/login_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/state/login_state.dart';

/// [LoginView] is a [StatefulWidget] that displays the sign up view.
@RoutePage()
final class LoginView extends StatefulWidget {
  /// Constructor
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin, AuthCommonViewMixin {
  double _expandedHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginViewModel>(
      create: (context) => loginViewModel,
      child: Form(
        key: loginFormKey,
        child: Stack(
          children: [
            BaseView(
              sliverAppBar: SliverAppBar(
                pinned: false,
                expandedHeight: _expandedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: CurvedImage(
                    image: Assets.icons.icLoginLogistic.svg(
                      fit: BoxFit.contain,
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
                      validator: emailValidator,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      prefixIcon: const Icon(Icons.lock_outline),
                      labelText: LocaleKeys.authentication_password.tr(),
                      hintText: LocaleKeys.authentication_password_placeholder.tr(),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      validator: passwordValidator,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _IsRememberMe(loginViewModel: loginViewModel),
                    ),
                    Padding(
                      padding:
                          PaddingManager.paddingManagerNormalPaddingSymmetricVertical,
                      child: CustomElevatedButton(
                        onPressed: () async {
                          final user = User(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          await loginOnPressed(context: context, user: user);
                        },
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
            TransparentScreen<LoginViewModel, LoginState>(
              child: Assets.lottie.lotLoading.lottie(package: 'gen'),
              selector: (state) => state.isLoading,
            )
          ],
        ),
      ),
    );
  }
}

final class _IsRememberMe extends StatelessWidget {
  const _IsRememberMe({
    required this.loginViewModel,
  });

  final LoginViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocSelector<LoginViewModel, LoginState, bool>(
          selector: (state) {
            return state.isRememberMe;
          },
          builder: (context, state) {
            return Row(
              children: [
                Checkbox(
                  value: state,
                  onChanged: (value) => loginViewModel.changeIsRememberMe(value ?? false),
                ),
                Text(
                  LocaleKeys.authentication_remember_me,
                  style: Theme.of(context).textTheme.bodyMedium,
                ).tr(),
              ],
            );
          },
        ),
        TextButton(
          onPressed: () async {
            await context.router.push(SendCodeToEMailRoute());
          },
          child: const Text(LocaleKeys.authentication_forgot_password).tr(),
        ),
      ],
    );
  }
}
