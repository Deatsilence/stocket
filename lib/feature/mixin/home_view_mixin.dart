import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/home_view.dart';
import 'package:stocket/feature/view/widget/custom_snackbar.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

/// [HomeViewMixin] is a [State] mixin that contains the home view logic.
mixin HomeViewMixin on State<HomeView> {
  /// [_homeViewModel] is the view model for the login view.
  late final HomeViewModel _homeViewModel;

  /// [_scrollController] is the controller for the scroll view.
  late final ScrollController _scrollController;

  /// [homeViewModel] is the view model for the login view.
  HomeViewModel get homeViewModel => _homeViewModel;

  /// [scrollController] is the controller for the scroll view.
  ScrollController get scrollController => _scrollController;

  @override
  void initState() {
    super.initState();
    log("HOMEVIEWMIXININIT");
    _homeViewModel = HomeViewModel();
    _scrollController = ScrollController();
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
    // log('scrollController position pixels: ${_scrollController.position.pixels}');
    // log('scrollController position maxScrollExtent: ${_scrollController.position.maxScrollExtent}');
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !_homeViewModel.state.isLoading) {
      // final currentScrollPosition = _scrollController.position.pixels;
      await getProducts(context: context);
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   _scrollController.jumpTo(currentScrollPosition);
      // });
    }
  }

  /// [_getProducts] is a method that fetches the products from the API.
  Future<void> getProducts({required BuildContext context}) async {
    final token = context.read<RootViewModel>().state.currentUser?.token ?? '';
    await _homeViewModel.getProducts(token: token).then(
      (value) {
        log('valuedata: ${value.data}');
        if (value.isSuccess) {
          log('SUCESS');
          _homeViewModel.setProducts(products: value.data as Products);
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
          // CustomSnackbar.show(
          //   context: context,
          //   message: LocaleKeys.product_delete_delete_product_success.tr(),
          //   backgroundColor: Theme.of(context).colorScheme.shadow,
          //   textColor: Theme.of(context).colorScheme.onPrimary,
          //   duration: Duration(seconds: DurationSeconds.short.value),
          // );
          _homeViewModel.extractAProductFromProducts(index: index);
        }
      },
    );
  }
}
