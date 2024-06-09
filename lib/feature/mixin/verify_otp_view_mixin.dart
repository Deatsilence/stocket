import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/auth/verify_otp_view.dart';
import 'package:stocket/feature/view/widget/custom_snackbar.dart';
import 'package:stocket/feature/view_model/send_code_to_email_view_model.dart';
import 'package:stocket/feature/view_model/verify_otp_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/constants/enums/response_type.dart';
import 'package:stocket/product/utility/constants/enums/status_code.dart';

/// [VerifyOTPViewMixin] is a [State] mixin that contains the login view logic.
mixin VerifyOTPViewMixin on State<VerifyOTPView> {
  /// [_countDown] is the count down for the resend verification code.
  final int _countDown = 60;

  /// [_verifyOTPViewModel] is the view model for the verify OTP view.
  late final VerifyOTPViewModel _verifyOTPViewModel;

  /// [_sendCodeToEMailViewModel] is the view model for the send code to email view.
  late final SendCodeToEMailViewModel _sendCodeToEMailViewModel;

  /// [countDown] is the count down for the resend verification code.
  int get countDown => _countDown;

  /// [verifyOTPViewModel] is the view model for the verify OTP view.
  VerifyOTPViewModel get verifyOTPViewModel => _verifyOTPViewModel;

  /// [sendCodeToEMailViewModel] is the view model for the send code to email view.
  SendCodeToEMailViewModel get sendCodeToEMailViewModel => _sendCodeToEMailViewModel;

  @override
  void initState() {
    super.initState();
    _verifyOTPViewModel = VerifyOTPViewModel();
    _sendCodeToEMailViewModel = SendCodeToEMailViewModel();
  }

  Future<void> onPressed(
      {required BuildContext context, required String emailAddress}) async {
    final email = SendEmail(email: emailAddress);

    final result = await sendCodeToEMailViewModel.sendOTP(email: email);

    if (result.isSuccess) {
      CustomSnackbar.show(
        context: context,
        message: LocaleKeys.authentication_send_verification_code_to_email.tr(),
        second: DurationSeconds.medium,
        responseType: ResponseType.success,
      );
    } else if (result.result == HttpResult.notFound) {
      CustomSnackbar.show(
        context: context,
        message: LocaleKeys.errors_user_not_found.tr(),
        second: DurationSeconds.medium,
        responseType: ResponseType.warning,
      );
    } else {
      CustomSnackbar.show(
        context: context,
        message: LocaleKeys.errors_occur_an_error_while_send_verification_code.tr(),
        second: DurationSeconds.medium,
        responseType: ResponseType.error,
      );
    }
  }
}
