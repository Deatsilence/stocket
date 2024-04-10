part of '../view/auth/verify_otp_view.dart';

final class _CustomPinput extends StatelessWidget {
  const _CustomPinput();

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: (value) async {},
      length: 6,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      followingPinTheme: PinTheme(
        height: 6.h,
        width: 10.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusManager.moreBorderRadius,
          border: Border.all(
            color: Theme.of(context).disabledColor,
          ),
        ),
        textStyle:
            Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      defaultPinTheme: PinTheme(
        height: 6.h,
        width: 10.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusManager.moreBorderRadius,
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        textStyle:
            Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
