import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/utility/extension/padding_extension.dart';

part '../../part_of_view/part_of_verify_otp_view.dart';

/// [VerifyOTPView] is a [StatefulWidget] that displays the verify OTP view.
@RoutePage()
final class VerifyOTPView extends StatefulWidget {
  const VerifyOTPView({super.key});

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends State<VerifyOTPView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context, value) => SliverList(
        delegate: SliverChildListDelegate(
          [
            AuthLabel(titleText: LocaleKeys.authentication_verify),
            AuthLabel(
              titleText: LocaleKeys.authentication_verify_email_sent,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
            ),
            AuthLabel(titleText: "Mert", style: Theme.of(context).textTheme.bodyLarge),
            _CustomPinput(),
            Column(
              children: [
                AuthLabel(
                  titleText: LocaleKeys.authentication_did_not_receive_verification_code,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: AuthLabel(
                    titleText: LocaleKeys.authentication_resend_verification_code,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ).onlyPadding(top: 2.h)
          ],
        ),
      ),
    );
  }
}
