import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/password_reset_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class PasswordResetViewModel extends BaseCubit<PasswordResetState> {
  PasswordResetViewModel() : super(PasswordResetState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<ApiResponse<dynamic>> resetPassword(
      {required ResetPassword resetPassword}) async {
    _changeLoading();
    try {
      var response = await CommonService.instance.postModel<ResetPassword>(
        domain: DevEnv().postResetPasswordDomain,
        model: resetPassword,
      );

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }

  Future<ApiResponse<dynamic>> changePassword(
      {required ChangePassword changePassword}) async {
    _changeLoading();
    try {
      var response = await CommonService.instance.postModel<ChangePassword>(
        domain: DevEnv().postChangePasswordDomain,
        model: changePassword,
      );

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }
}
