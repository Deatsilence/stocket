import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

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
            _CustomPinput(),
          ],
        ),
      ),
    );
  }
}
