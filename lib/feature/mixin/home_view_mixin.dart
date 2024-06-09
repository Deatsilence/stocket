import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/home_view.dart';
import 'package:stocket/feature/view/widget/custom_snackbar.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/init/cache/cache_manager.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/constants/enums/response_type.dart';
import 'package:stocket/product/utility/constants/enums/status_code.dart';

/// [HomeViewMixin] is a [State] mixin that contains the home view logic.
mixin HomeViewMixin on State<HomeView> {
  /// [_homeViewModel] is the view model for the login view.
  late final HomeViewModel _homeViewModel;

  /// [_scrollController] is the controller for the scroll view.
  late final ScrollController _scrollController;

  /// [_searchController] is the controller for the search view.
  late final TextEditingController _searchController;

  /// [homeViewModel] is the view model for the login view.
  HomeViewModel get homeViewModel => _homeViewModel;

  /// [scrollController] is the controller for the scroll view.
  ScrollController get scrollController => _scrollController;

  /// [searchController] is the controller for the search view.
  TextEditingController get searchController => _searchController;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel();
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    getProducts(context: context);
    _scrollController.addListener(() => _onScroll(context: context));
  }

  @override
  void dispose() {
    _scrollController.removeListener(() => _onScroll(context: context));
    _scrollController.dispose();
    super.dispose();
  }

  /// [_onScroll] is the callback for the scroll view.
  Future<void> _onScroll({required BuildContext context}) async {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !_homeViewModel.state.isLoading) {
      final products = _homeViewModel.state.products;
      if ((_homeViewModel.state.page + 1) > (products?.totalPages ?? 0)) {
        return;
      }
      _homeViewModel.setThePage(page: (products?.currentPage ?? 1) + 1);
      await getProducts(context: context);
    }
  }

  /// [getProducts] is a method that fetches the products from the API.
  Future<void> getProducts({required BuildContext context}) async {
    final token = context.read<RootViewModel>().state.currentUser?.token ?? '';

    await _homeViewModel.getProducts(token: token).then(
      (value) async {
        final currentScrollPosition = _scrollController.position.pixels;
        if (value.isSuccess) {
          final newProducts = value.data as Products;
          late final Products products;
          if (_homeViewModel.state.page == 1) {
            products = Products(
              productItems: newProducts.productItems,
              totalCount: newProducts.totalCount,
              totalPages: newProducts.totalPages,
              currentPage: newProducts.currentPage,
            );
          } else {
            final currentProducts = _homeViewModel.state.products?.productItems ?? [];
            final updatedProducts = List<Product>.from(currentProducts)
              ..addAll(newProducts.productItems ?? []);
            products = Products(
              productItems: updatedProducts,
              totalCount: newProducts.totalCount,
              totalPages: newProducts.totalPages,
              currentPage: newProducts.currentPage,
            );
          }

          _homeViewModel.setProducts(products: products);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollController.jumpTo(currentScrollPosition);
          });
        } else if (value.result == HttpResult.unauthorized) {
          CustomSnackbar.show(
            context: context,
            message: LocaleKeys.errors_expired_the_session.tr(),
            responseType: ResponseType.error,
            second: DurationSeconds.medium,
          );
          await CacheManager.instance.clearSP();
          await context.router.replace(const AuthRootRoute());
        } else {
          CustomSnackbar.show(
            context: context,
            message: LocaleKeys.errors_occur_while_fetching_products.tr(),
            responseType: ResponseType.error,
            second: DurationSeconds.medium,
          );
        }
      },
    );
  }

  Future<void> searchByBarcode({
    required BuildContext context,
    required String barcode,
  }) async {
    final token = context.read<RootViewModel>().state.currentUser?.token ?? '';

    await _homeViewModel.getProducts(token: token, prefixOfBarcode: barcode).then(
      (value) {
        if (value.isSuccess) {
          final searchedProducts = value.data as Products;
          log('searchedProducts: $searchedProducts');
          _homeViewModel.setProducts(products: searchedProducts);
        } else {
          CustomSnackbar.show(
            context: context,
            message: LocaleKeys.errors_occur_while_fetching_products.tr(),
            responseType: ResponseType.error,
            second: DurationSeconds.medium,
          );
        }
      },
    );
  }

  /// [deleteProduct] is a method that deletes a product from the API.
  Future<void> deleteProduct({
    required BuildContext context,
    required int index,
    required String productId,
  }) async {
    final token = context.read<RootViewModel>().state.currentUser?.token ?? '';
    await _homeViewModel.deleteProduct(token: token, id: productId).then(
      (value) {
        if (value.isSuccess) {
          CustomSnackbar.show(
            context: context,
            message: LocaleKeys.product_delete_delete_product_success.tr(),
            responseType: ResponseType.success,
            second: DurationSeconds.short,
          );
          _homeViewModel.extractAProductFromProducts(index: index);
        }
      },
    );
  }
}
