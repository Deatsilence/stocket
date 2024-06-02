import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/splash_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class SplashViewModel extends BaseCubit<SplashState> {
  SplashViewModel() : super(SplashState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<ApiResponse<dynamic>> loginWithCache({required User user}) async {
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
