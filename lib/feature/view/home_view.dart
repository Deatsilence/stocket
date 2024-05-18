import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/feature/mixin/home_view_mixin.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view/widget/product_card.dart';
import 'package:stocket/feature/view/widget/side_menu.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/state/home_state.dart';
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
      child: Stack(
        children: [
          BaseView(
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
            onPageBuilder: (context, value) => _ProductList(),
          ),
          // TransparentScreen<HomeViewModel, HomeState>(
          //   child: Assets.lottie.lotLoading.lottie(package: 'gen'),
          //   selector: (state) => state.isLoading,
          // )
        ],
      ),
    );
  }
}

/// [_ProductList] is the list of products.
final class _ProductList extends StatelessWidget {
  const _ProductList();

  @override
  Widget build(BuildContext context) {
    log('ProductList build');
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return SliverToBoxAdapter(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (!state.products.hasValue && state.products!.totalCount == 0) {
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
            itemBuilder: (context, index) {
              if (index < _products.productItems!.length) {
                log('_products.productItems!.length: ${_products.productItems!.length}');
                final _product = _products.productItems![index];
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
            },
          );
        }
      },
    );
  }
}
