part of '../view/auth/verify_otp_view.dart';

final class _CustomPinput extends StatelessWidget {
  const _CustomPinput();

  final int _digitLength = 6;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: (value) async {},
      length: _digitLength,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      followingPinTheme: PinTheme(
        height: 6.h,
        width: 10.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadiusManager.moreBorderRadius,
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
      ),
      defaultPinTheme: PinTheme(
        height: 6.h,
        width: 10.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          borderRadius: BorderRadiusManager.moreBorderRadius,
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
