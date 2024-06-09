import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gen/gen.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/feature/mixin/home_view_mixin.dart';
import 'package:stocket/feature/view/product_add_view.dart';
import 'package:stocket/feature/view/widget/custom_snackbar.dart';
import 'package:stocket/feature/view/widget/product_card.dart';
import 'package:stocket/feature/view/widget/side_menu.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/state/home_state.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/constants/enums/product_view_type.dart';
import 'package:stocket/product/utility/constants/enums/response_type.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

part '../part_of_view/part_of_home_view.dart';

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
    return BlocProvider<HomeViewModel>(
      create: (context) => homeViewModel,
      child: BaseView(
        controller: scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        isSliverFillRemaining: false,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            var result = await context.router.push<bool?>(ProductAddRoute());
            if (result.hasValue && result!) {
              homeViewModel.setThePageAsDefault();
              await getProducts(context: context);
            }
          },
          icon: const Icon(Icons.add),
          label: const Text(LocaleKeys.home_add_a_new_product).tr(),
        ),
        drawer: SideMenu(homeViewModel: homeViewModel),
        sliverAppBar: SliverAppBar(
          title: SizedBox(
            height: 5.h,
            child: CustomTextFormField(
              controller: searchController,
              prefixIcon: const Icon(Icons.search_outlined),
              hintText: LocaleKeys.home_search_placeholder.tr(),
              onChanged: (value) => searchByBarcode(
                context: context,
                barcode: value,
              ),
              onClear: () => searchByBarcode(
                context: context,
                barcode: '',
              ),
            ),
          ),
          centerTitle: true,
          pinned: true,
          floating: false,
          scrolledUnderElevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: Theme.of(context).iconTheme.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        onPageBuilder: (context, value) => BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) {
            return _ProductList(
              deleteProduct: ({
                required BuildContext context,
                required int index,
                required String id,
              }) =>
                  deleteProduct(context: context, index: index, productId: id),
              getProducts: ({required context}) => getProducts(context: context),
              state: state,
            );
          },
        ),
      ),
    );
  }
}

/// [_ProductList] is the list of products.
final class _ProductList extends StatefulWidget {
  const _ProductList({
    required this.deleteProduct,
    required this.state,
    required this.getProducts,
  });

  final Future<void> Function({
    required BuildContext context,
    required int index,
    required String id,
  }) deleteProduct;

  final Future<void> Function({
    required BuildContext context,
  }) getProducts;

  final HomeState state;

  @override
  State<_ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<_ProductList> {
  late BuildContext _parentContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _parentContext = context;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.isLoading) {
      return SliverToBoxAdapter(
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (!widget.state.products.hasValue &&
            widget.state.products?.totalCount == null ||
        widget.state.products!.totalCount == 0) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(LocaleKeys.errors_no_products_available).tr(),
        ),
      );
    } else {
      final _products = widget.state.products!;
      final _length = _products.productItems!.length;
      return SliverList.builder(
        itemCount: (_length % 4 == 0 && (_products.currentPage! < _products.totalPages!))
            ? _length + 1
            : _length,
        itemBuilder: (context, index) {
          if (index < _length) {
            return Slidable(
              endActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    icon: Icons.edit_outlined,
                    backgroundColor: ColorName.edit,
                    onPressed: (context) async => await _onPressedEditProduct(
                      context: _parentContext,
                      index: index,
                      products: _products,
                    ),
                  ),
                  SlidableAction(
                    icon: Icons.delete_outlined,
                    backgroundColor: ColorName.delete,
                    onPressed: (context) async {
                      await _onPressedDeleteProduct(
                        context: _parentContext,
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
            );
          }
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      );
    }
  }

  Future<void> _onPressedDeleteProduct({
    required BuildContext context,
    required int index,
    required Products products,
  }) async {
    final _product = products.productItems![index];
    if (!_product.productid.hasValue) {
      CustomSnackbar.show(
        context: context,
        message: LocaleKeys.product_delete_delete_product_fail.tr(),
        second: DurationSeconds.short,
        responseType: ResponseType.error,
      );
    }
    await widget.deleteProduct(context: context, index: index, id: _product.productid!);
  }

  Future<void> _onPressedEditProduct({
    required BuildContext context,
    required int index,
    required Products products,
  }) async {
    final _product = products.productItems![index];
    if (!_product.productid.hasValue) {
      CustomSnackbar.show(
        context: context,
        message: LocaleKeys.product_update_product_update_fail.tr(),
        second: DurationSeconds.short,
        responseType: ResponseType.error,
      );
    }
    final result = await context.router.push<bool?>(
      ProductAddRoute(
        product: _product,
        viewType: ProductViewType.edit,
      ),
    );
    if (result.hasValue && result!) {
      await widget.getProducts(context: context);
    }
  }
}
