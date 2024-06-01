import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/mixin/auth_common_view_mixin.dart';
import 'package:stocket/feature/mixin/send_code_to_email_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';
import 'package:stocket/feature/view/widget/transparent_loading.dart';
import 'package:stocket/feature/view_model/send_code_to_email_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/state/send_code_to_email_state.dart';

/// [SendCodeToEMailView] is a [StatefulWidget] that displays the send code to mail view.
@RoutePage()
final class SendCodeToEMailView extends StatefulWidget {
  const SendCodeToEMailView({super.key});

  @override
  State<SendCodeToEMailView> createState() => _SendCodeToEMailViewState();
}

class _SendCodeToEMailViewState extends State<SendCodeToEMailView>
    with AuthCommonViewMixin, SendCodeToEMailViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SendCodeToEMailViewModel>(
      create: (context) => sendCodeToEMailViewModel,
      child: Form(
        key: sendCodeToEmailFormKey,
        child: Stack(
          children: [
            BaseView(
              sliverAppBar: SliverAppBar(),
              onPageBuilder: (context, value) => SliverList(
                delegate: SliverChildListDelegate(
                  [
                    AuthLabel(
                      text: LocaleKeys.authentication_password_reset,
                    ),
                    AuthLabel(
                      text: LocaleKeys.authentication_enter_your_email_to_reset_password,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).disabledColor,
                          ),
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
                    CustomElevatedButton(
                      onPressed: () async => await onPressed(
                        context: context,
                        emailAddress: emailController.text,
                      ),
                      child: Text(
                        LocaleKeys.authentication_send_verification_code_to_email,
                      ).tr(),
                    )
                  ],
                ),
              ),
            ),
            TransparentScreen<SendCodeToEMailViewModel, SendToEMailState>(
              child: Assets.lottie.lotLoading.lottie(package: 'gen'),
              selector: (state) => state.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
