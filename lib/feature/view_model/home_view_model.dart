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

  void setThePage({required int page}) {
    emit(state.copyWith(page: page));
  }

  void increasePage() {
    emit(state.copyWith(page: state.page + 1));
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

  Future<ApiResponse<dynamic>> getProducts(
      {required String token, String? prefixOfBarcode}) async {
    _changeLoading();
    try {
      const _recordPerPage = 4;
      Products products = Products();
      CommonService.instance.token = token;
      var response = await CommonService.instance.getModel<Products>(
        domain: DevEnv().getProductsDomain,
        model: products,
        queryParameters: {
          'prefix': prefixOfBarcode,
          'page': state.page,
          'recordPerPage': _recordPerPage,
        },
      );

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

  // Future<ApiResponse<dynamic>> searchByBarcode({
  //   required String barcode,
  //   required String token,
  // }) async {
  //   _changeLoading();
  //   try {
  //     Products products = Products();
  //     CommonService.instance.token = token;
  //     var response = await CommonService.instance.getModel<Products>(
  //       domain: "${DevEnv().getSearchByBarcodeDomain}",
  //       model: products,
  //       queryParameters: {
  //         'barcode': barcode,
  //       },
  //     );

  //     _changeLoading();
  //     return response;
  //   } catch (e) {
  //     Logger().e(e.toString());
  //     throw e;
  //   }
  // }
}
