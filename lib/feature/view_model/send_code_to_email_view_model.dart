import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/send_code_to_email_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class SendCodeToEMailViewModel extends BaseCubit<SendToEMailState> {
  SendCodeToEMailViewModel() : super(SendToEMailState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<ApiResponse<dynamic>> sendOTP({required SendEmail email}) async {
    _changeLoading();
    try {
      var response = await CommonService.instance.postModel<SendEmail>(
        domain: DevEnv().postRequestResetPasswordDomain,
        model: email,
      );

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }
}
