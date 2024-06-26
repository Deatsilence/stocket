
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/mixin/password_reset_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view_model/password_reset_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/state/password_reset_state.dart';

/// [PasswordResetView] is a [StatefulWidget] that displays the sign up view.
@RoutePage()
final class PasswordResetView extends StatefulWidget {
  /// Constructor
  const PasswordResetView({
    super.key,
    required this.islogin,
    required this.verifyOTP,
  });

  final VerifyOTP verifyOTP;
  final bool islogin;

  @override
  State<PasswordResetView> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordResetView>
    with AuthCommonViewMixin, PasswordResetViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordResetViewModel>(
      create: (context) => passwordResetViewModel,
      child: Form(
        key: passwordResetFormKey,
        child: Stack(
          children: [
            BaseView(
              sliverAppBar: widget.islogin ? SliverAppBar() : null,
              onPageBuilder: (context, value) => SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const AuthLabel(
                      textAlign: TextAlign.start,
                      text: LocaleKeys.authentication_password_reset,
                    ),
                    if (widget.islogin)
                      CustomTextFormField(
                        controller: oldPasswordController,
                        prefixIcon: const Icon(Icons.password_outlined),
                        labelText: LocaleKeys.authentication_old_password.tr(),
                        hintText: LocaleKeys.authentication_old_password_placeholder.tr(),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        validator: passwordValidator,
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
                        onPressed: () => onPressed(
                          context: context,
                          isLogin: widget.islogin,
                          verifyOTP: widget.verifyOTP,
                        ),
                        child: widget.islogin
                            ? const Text(LocaleKeys.authentication_change_password).tr()
                            : const Text(LocaleKeys.authentication_reset_password).tr(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TransparentScreen<PasswordResetViewModel, PasswordResetState>(
              child: Assets.lottie.lotLoading.lottie(package: 'gen'),
              selector: (state) => state.isLoading,
            )
          ],
        ),
      ),
    );
  }
}
