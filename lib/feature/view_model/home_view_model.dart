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

  void setProducts({required Products products}) {
    emit(state.copyWith(products: products));
  }

  void extractAProductFromProducts({required int index}) {
    final updateProducts = state.products?.deleteProduct(index) ?? state.products;
    emit(state.copyWith(products: updateProducts));
  }

  void _increasePage() {
    log('BEFORE page: ${state.page}');
    emit(state.copyWith(page: state.page + 1));
    log('AFTER page: ${state.page}');
  }

  void setThePageAsDefault() {
    emit(state.copyWith(page: 1));
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
      const _recordPerPage = 10;
      Products products = Products();
      CommonService.instance.token = token;
      var response = await CommonService.instance.getModel<Products>(
        domain: DevEnv().getProductsDomain,
        model: products,
        queryParameters: {
          'page': 1,
          'recordPerPage': _recordPerPage,
        },
      );
      log('page: ${state.page}');
      // _increasePage();

      log('response: ${response.toString()}');
      _changeLoading();
      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }

  Future<ApiResponse<dynamic>> deleteProduct({
    required String token,
    required String id,
  }) async {
    _changeLoading();
    try {
      CommonService.instance.token = token;
      var response = await CommonService.instance.delete(
        domain: DevEnv().deleteProductsByIdDomain,
        id: id,
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
