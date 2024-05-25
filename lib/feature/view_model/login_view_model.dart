
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/login_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class LoginViewModel extends BaseCubit<LoginState> {
  LoginViewModel() : super(LoginState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<ApiResponse<dynamic>> login({required User user}) async {
    _changeLoading();
    try {
      var response = await CommonService.instance.postModel<User>(
        domain: DevEnv().postUsersLoginDomain,
        model: user,
      );

      // log('response: ${response.toString()}');
      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }
}
