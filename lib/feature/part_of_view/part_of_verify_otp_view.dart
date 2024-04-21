part of '../view/auth/verify_otp_view.dart';

final class _CustomPinput extends StatelessWidget {
  const _CustomPinput({
    required VerifyOTPViewModel verifyOTPViewModel,
    required String email,
  })  : _viewModel = verifyOTPViewModel,
        _email = email;

  final VerifyOTPViewModel _viewModel;
  final String _email;
  final int _digitLength = 6;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: (value) async {
        final otp = VerifyOTP(email: _email, code: value);
        await _viewModel.verifyOTP(otp: otp).then(
              (value) => value.isSuccess
                  ? context.router.pushAndPopUntil(
                      LoginRoute(),
                      predicate: (route) => route.settings.name == VerifyOTPRoute.name,
                    )
                  : null,
            );
        // TODO: Alert Dialog will be come to instead of null
      },
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
