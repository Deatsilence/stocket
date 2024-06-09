import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/verify_otp_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class VerifyOTPViewModel extends BaseCubit<VerifyOTPState> {
  VerifyOTPViewModel() : super(VerifyOTPState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<ApiResponse<dynamic>> verifyOTP({required VerifyOTP otp}) async {
    _changeLoading();
    try {
      var response = await CommonService.instance.postModel<VerifyOTP>(
        domain: DevEnv().postVerifyEmailDomain,
        model: otp,
      );

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }
}
