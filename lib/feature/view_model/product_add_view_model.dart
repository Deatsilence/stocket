import 'dart:developer';
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

  Future<ApiResponse<dynamic>> createProduct({required Product product}) async {
    _changeLoading();
    try {
      var response = await CommonService.instance.postModel<Product>(
        domain: DevEnv().postProductsAddDomain,
        model: product,
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
