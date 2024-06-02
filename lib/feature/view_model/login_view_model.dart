import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/init/cache/cache_manager.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/login_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class LoginViewModel extends BaseCubit<LoginState> {
  LoginViewModel() : super(LoginState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void changeIsRememberMe(bool value) {
    emit(state.copyWith(isRememberMe: value));
  }

  Future<void> setUserDataToSP({required User user}) async {
    await CacheManager.instance.setUserDataToSP(user: user);
  }

  Future<void> setLoginDataToSP({required Login login}) async {
    await CacheManager.instance.setLoginDataToSP(login: login);
  }

  Future<void> setIsLoginToSP({required bool isLogin}) async {
    await CacheManager.instance.setSignInSP(isSignedIn: isLogin);
  }

  Future<ApiResponse<dynamic>> login({required User user}) async {
    _changeLoading();
    try {
      var response = await CommonService.instance.postModel<User>(
        domain: DevEnv().postUsersLoginDomain,
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
