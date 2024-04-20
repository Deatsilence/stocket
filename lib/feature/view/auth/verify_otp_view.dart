import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/feature/mixin/verify_otp_view_mixin.dart';
import 'package:stocket/feature/view/widget/auth_label.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view_model/verify_otp_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/utility/extension/padding_extension.dart';

part '../../part_of_view/part_of_verify_otp_view.dart';

/// [VerifyOTPView] is a [StatefulWidget] that displays the verify OTP view.
@RoutePage()
final class VerifyOTPView extends StatefulWidget {
  const VerifyOTPView({super.key, required this.email});

  final String email;

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends State<VerifyOTPView> with VerifyOTPViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => verifyOTPViewModel,
      child: BaseView(
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              AuthLabel(text: LocaleKeys.authentication_verify),
              AuthLabel(
                text: LocaleKeys.authentication_verify_email_sent,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
              ),
              AuthLabel(text: widget.email, style: Theme.of(context).textTheme.bodyLarge),
              _CustomPinput(
                verifyOTPViewModel: verifyOTPViewModel,
                email: widget.email,
              ),
              Column(
                children: [
                  AuthLabel(
                    text: LocaleKeys.authentication_did_not_receive_verification_code,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: AuthLabel(
                      text: LocaleKeys.authentication_resend_verification_code,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ).onlyPadding(top: 2.h),
              CountDown(startValue: countDown),
            ],
          ),
        ),
      ),
    );
  }
}
