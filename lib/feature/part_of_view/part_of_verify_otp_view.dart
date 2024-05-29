part of '../view/auth/verify_otp_view.dart';

final class _CustomPinput extends StatelessWidget {
  const _CustomPinput({
    required VerifyOTPViewModel verifyOTPViewModel,
    required String email,
    required this.afterOtpVerify,
  })  : _viewModel = verifyOTPViewModel,
        _email = email;

  final VerifyOTPViewModel _viewModel;
  final String _email;
  final int _digitLength = 6;
  final AfterOtpVerify afterOtpVerify;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: (value) => _onComplated(
        context: context,
        value: value,
        afterOtpVerify: afterOtpVerify,
      ),
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

  Future<void> _onComplated({
    required BuildContext context,
    required String value,
    required AfterOtpVerify afterOtpVerify,
  }) async {
    final otp = VerifyOTP(email: _email, code: value);
    await _viewModel.verifyOTP(otp: otp).then(
      (value) async {
        if (value.isSuccess) {
          if (afterOtpVerify == AfterOtpVerify.login) {
            await context.router.pushAndPopUntil(
              LoginRoute(),
              predicate: (route) => route.settings.name == VerifyOTPRoute.name,
            );
            CustomSnackbar.show(
              context: context,
              message: LocaleKeys.authentication_register_success.tr(),
              second: DurationSeconds.medium,
              responseType: ResponseType.success,
            );
          } else {
            await context.router.pushAndPopUntil(
              PasswordResetRoute(verifyOTP: otp, islogin: false),
              predicate: (route) => route.settings.name == VerifyOTPRoute.name,
            );
          }
        } else if (value.result == HttpResult.notFound) {
          CustomSnackbar.show(
            context: context,
            message: LocaleKeys.errors_user_not_found.tr(),
            second: DurationSeconds.medium,
            responseType: ResponseType.info,
          );
        } else {
          CustomSnackbar.show(
            context: context,
            message: LocaleKeys.errors_occur_an_error_while_send_verification_code.tr(),
            second: DurationSeconds.medium,
            responseType: ResponseType.error,
          );
        }
      },
    );
  }
}
