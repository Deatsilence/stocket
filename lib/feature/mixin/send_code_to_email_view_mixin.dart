import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/auth/send_code_to_email_view.dart';
import 'package:stocket/feature/view_model/send_code_to_email_view_model.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/utility/constants/enums/after_otp_verify.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

mixin SendCodeToEMailViewMixin on State<SendCodeToEMailView> {
  /// [_sendCodeToEmailFormKey] is the key for the send code to email form.
  late final GlobalKey<FormState> _sendCodeToEmailFormKey;

  /// [_sendCodeToEMailViewModel] is the view model for the send code to email view.
  late final SendCodeToEMailViewModel _sendCodeToEMailViewModel;

  /// [sendCodeToEmailFormKey] is the key for the send code to email form.
  GlobalKey<FormState> get sendCodeToEmailFormKey => _sendCodeToEmailFormKey;

  /// [sendCodeToEMailViewModel] is the view model for the send code to email view.
  SendCodeToEMailViewModel get sendCodeToEMailViewModel => _sendCodeToEMailViewModel;

  @override
  void initState() {
    super.initState();
    _sendCodeToEmailFormKey = GlobalKey<FormState>();
    _sendCodeToEMailViewModel = SendCodeToEMailViewModel();
  }

  Future<void> onPressed(
      {required BuildContext context, required String emailAddress}) async {
    var currentState = sendCodeToEmailFormKey.currentState;
    if (currentState.hasValue && currentState!.validate()) {
      currentState.save();

      final email = SendEmail(email: emailAddress);

      await sendCodeToEMailViewModel.sendOTP(email: email);

      final predicate = ModalRoute.withName(SendCodeToEMailRoute.name);
      await context.router.pushAndPopUntil(
        VerifyOTPRoute(
          email: emailAddress,
          afterOtpVerify: AfterOtpVerify.resetPassword,
        ),
        predicate: predicate,
      );
    }
  }
}
