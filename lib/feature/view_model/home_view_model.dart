import 'dart:developer';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/home_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel() : super(HomeState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<ApiResponse<dynamic>> logout({required String token}) async {
    _changeLoading();
    try {
      CommonService.instance.token = token;
      var response = await CommonService.instance.postWithoutModel(
        domain: DevEnv().postLogoutDomain,
      );

      log('response: ${response.toString()}');
      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }

  Future<ApiResponse<dynamic>> getProducts({required String token}) async {
    _changeLoading();
    try {
      Products products = Products();
      CommonService.instance.token = token;
      var response = await CommonService.instance.getModel<Products>(
        domain: DevEnv().getProductsDomain,
        model: products,
      );

      log('response: ${response.toString()}');
      _changeLoading();
      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }
}
