import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/mixin/home_view_mixin.dart';
import 'package:stocket/feature/view/widget/custom_snackbar.dart';
import 'package:stocket/feature/view/widget/product_card.dart';
import 'package:stocket/feature/view/widget/side_menu.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/home_state.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

/// [HomeView] is main screen of the app
@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    log('${context.router.stack}');
    return BlocProvider<HomeViewModel>(
      create: (context) => homeViewModel,
      child: BaseView(
        controller: scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        isSliverFillRemaining: false,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async => await context.router.push(const ProductAddRoute()),
          icon: const Icon(Icons.add),
          label: const Text(LocaleKeys.home_add_a_new_product).tr(),
        ),
        drawer: SideMenu(homeViewModel: homeViewModel),
        sliverAppBar: SliverAppBar(
          title: Text(
            LocaleKeys.home_title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ).tr(),
          centerTitle: true,
          pinned: true,
          floating: false,
          scrolledUnderElevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: Theme.of(context).iconTheme.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        onPageBuilder: (context, value) => _ProductList(({
          required BuildContext context,
          required int index,
          required String id,
        }) =>
            deleteProduct(context: context, index: index, productId: id)),
      ),
    );
  }
}

/// [_ProductList] is the list of products.
final class _ProductList extends StatefulWidget {
  const _ProductList(this.deleteProduct);

  final Future<void> Function({
    required BuildContext context,
    required int index,
    required String id,
  }) deleteProduct;

  @override
  State<_ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<_ProductList> {
  @override
  Widget build(BuildContext context) {
    log('ProductList build');
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return SliverToBoxAdapter(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (!state.products.hasValue && state.products?.totalCount == null ||
            state.products!.totalCount == 0) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(LocaleKeys.errors_no_products_available).tr(),
            ),
          );
        } else {
          final _products = state.products!;
          log('HOME PAGE: ${state.page}');
          return SliverList.builder(
            itemCount: state.isLoading
                ? _products.productItems!.length + 1
                : _products.productItems!.length,
            itemBuilder: (context, index) => Slidable(
              endActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    icon: Icons.edit_outlined,
                    backgroundColor: ColorName.edit,
                    onPressed: (context) {},
                  ),
                  SlidableAction(
                    icon: Icons.delete_outlined,
                    backgroundColor: ColorName.delete,
                    onPressed: (context) async {
                      await _onPressedDeleteProduct(
                        context: context,
                        index: index,
                        products: _products,
                      );
                    },
                  ),
                ],
              ),
              child: _ProductItemBuilder(
                index: index,
                products: _products,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _onPressedDeleteProduct({
    required BuildContext context,
    required int index,
    required Products products,
  }) async {
    final _product = products.productItems![index];
    log('products: ${products}');
    log('product: ${_product.productid}');
    if (!_product.productid.hasValue) {
      CustomSnackbar.show(
          context: context,
          message: LocaleKeys.product_delete_delete_product_fail.tr(),
          backgroundColor: Theme.of(context).colorScheme.onError,
          textColor: Theme.of(context).colorScheme.onPrimary,
          duration: Duration(seconds: DurationSeconds.veryShort.value));
    }
    await widget.deleteProduct(context: context, index: index, id: _product.productid!);
  }
}

final class _ProductItemBuilder extends StatelessWidget {
  final int index;
  final Products products;

  const _ProductItemBuilder({
    required this.index,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    if (index < products.productItems!.length) {
      final _product = products.productItems![index];
      return ProductCard(
        barcode: _product.barcode ?? '',
        description: _product.description ?? '',
        name: _product.name ?? '',
        price: _product.price ?? 0.0,
        stock: _product.stock ?? 0,
        category: _product.category ?? 1,
      );
    }
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
