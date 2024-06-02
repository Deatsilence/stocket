import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/signup_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class SignUpViewModel extends BaseCubit<SignUpState> {
  SignUpViewModel() : super(SignUpState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<ApiResponse<dynamic>> signUp({required User user}) async {
    _changeLoading();
    try {
      var response = await CommonService.instance.postModel<User>(
        domain: DevEnv().postUsersSignupDomain,
        model: user,
      );

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }
}
