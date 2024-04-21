import 'package:flutter/material.dart';
import 'package:stocket/feature/view/auth/verify_otp_view.dart';
import 'package:stocket/feature/view_model/verify_otp_view_model.dart';

/// [VerifyOTPViewMixin] is a [State] mixin that contains the login view logic.
mixin VerifyOTPViewMixin on State<VerifyOTPView> {
  /// [_countDown] is the count down for the resend verification code.
  final int _countDown = 60;

  late final VerifyOTPViewModel _verifyOTPViewModel;

  /// [countDown] is the count down for the resend verification code.
  int get countDown => _countDown;

  /// [verifyOTPViewModel] is the view model for the verify OTP view.
  VerifyOTPViewModel get verifyOTPViewModel => _verifyOTPViewModel;

  @override
  void initState() {
    super.initState();
    _verifyOTPViewModel = VerifyOTPViewModel();
  }
}
