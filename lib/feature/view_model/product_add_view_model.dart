import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/product_add_state.dart';
import 'package:stocket/product/utility/response/api_response.dart';

final class ProductAddViewModel extends BaseCubit<ProductAddState> {
  ProductAddViewModel() : super(ProductAddState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void setCategory({required int category}) {
    emit(state.copyWith(category: category));
  }

  Future<ApiResponse<dynamic>> createProduct({
    required Product product,
    required String token,
  }) async {
    _changeLoading();
    try {
      CommonService.instance.token = token;
      var response = await CommonService.instance.postModel<Product>(
        domain: DevEnv().postProductsAddDomain,
        model: product,
      );

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }

  Future<ApiResponse<dynamic>> editProduct({
    required Product product,
    required String token,
  }) async {
    _changeLoading();
    try {
      CommonService.instance.token = token;
      var response = await CommonService.instance.putModel<Product>(
        domain: DevEnv().putProductsByIdDomain,
        model: product,
        id: product.productid ?? '',
      );

      _changeLoading();

      return response;
    } catch (e) {
      Logger().e(e.toString());
      throw e;
    }
  }
}
