import 'dart:developer';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/init/cache/cache_manager.dart';
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

  void increasePage() {
    emit(state.copyWith(page: state.page + 1));
  }

  void decreasePage() {
    emit(state.copyWith(page: state.page - 1));
  }

  void setThePageAsDefault() {
    emit(state.copyWith(page: 1));
  }

  Future<void> clearCache() async {
    await CacheManager.instance.clearSP();
  }

  Future<ApiResponse<dynamic>> logout({required String token}) async {
    _changeLoading();
    try {
      CommonService.instance.token = token;
      var response = await CommonService.instance.postWithoutModel(
        domain: DevEnv().postLogoutDomain,
      );

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
      const _recordPerPage = 4;
      Products products = Products();
      CommonService.instance.token = token;
      var response = await CommonService.instance.getModel<Products>(
        domain: DevEnv().getProductsDomain,
        model: products,
        queryParameters: {
          'page': state.page,
          'recordPerPage': _recordPerPage,
        },
      );
      if (!response.isSuccess) {
        decreasePage();
      }

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

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }

  Future<ApiResponse<dynamic>> searchByBarcode({
    required String barcode,
    required String token,
  }) async {
    _changeLoading();
    try {
      CommonService.instance.token = token;
      var response = await CommonService.instance.getModel<Products>(
        domain: DevEnv().getProductsDomain,
        model: Products(),
        queryParameters: {
          'prefix': barcode,
        },
      );

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }
}
