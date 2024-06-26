import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/feature/mixin/product_add_view_mixin.dart';
import 'package:stocket/feature/view/widget/appbar_title.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view_model/product_add_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/state/product_add_state.dart';
import 'package:stocket/product/utility/constants/enums/product_view_type.dart';
import 'package:stocket/product/utility/extension/padding_extension.dart';

/// [ProductAddView] is main screen of the app
@RoutePage<bool?>()
final class ProductAddView extends StatefulWidget {
  const ProductAddView({
    super.key,
    this.viewType = ProductViewType.add,
    this.product,
  });

  final ProductViewType viewType;
  final Product? product;

  @override
  State<ProductAddView> createState() => _ProductAddViewState();
}

class _ProductAddViewState extends State<ProductAddView> with ProductAddViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductAddViewModel>(
      create: (context) => productAddViewModel,
      child: Form(
        key: productAddFormKey,
        child: Stack(
          children: [
            BaseView(
              onPopInvoked: (didPop) async =>
                  didPop ? await context.router.maybePop<bool?>(true) : null,
              physics: AlwaysScrollableScrollPhysics(),
              sliverAppBar: SliverAppBar(
                leading: BackButton(
                  onPressed: () async => await context.router.maybePop<bool?>(true),
                ),
                title: FlexableLabel(
                  title: widget.viewType == ProductViewType.add
                      ? LocaleKeys.home_add_a_new_product
                      : LocaleKeys.product_update_product_information,
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
              onPageBuilder: (context, value) => SliverList(
                delegate: SliverChildListDelegate(
                  [
                    CustomDivider(
                        text: Text(
                      LocaleKeys.product_add_category,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr()),
                    SelectableTag(
                      value: category,
                      source: CategoryType.names,
                      onChanged: (value) =>
                          productAddViewModel.setCategory(category: value),
                    ),
                    CustomDivider(
                            text: Text(
                      LocaleKeys.product_add_product_information,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr())
                        .onlyPadding(bottom: 2.0.h),
                    CustomTextFormField(
                      controller: barcodeController,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.qr_code_scanner),
                        onPressed: onPressedNavigateToBarcodeScan,
                      ),
                      prefixIcon: const Icon(Icons.barcode_reader),
                      labelText: LocaleKeys.product_add_barcode.tr(),
                      hintText: LocaleKeys.product_add_barcode_placeholder.tr(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      enabled: widget.viewType == ProductViewType.add,
                      validator: barcodeValidator,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      prefixIcon: const Icon(Icons.shopping_basket_outlined),
                      labelText: LocaleKeys.product_add_name.tr(),
                      hintText: LocaleKeys.product_add_name_placeholder.tr(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: nameValidator,
                    ),
                    CustomTextFormField(
                      controller: descriptionController,
                      prefixIcon: const Icon(Icons.description_outlined),
                      labelText: LocaleKeys.product_add_description.tr(),
                      hintText: LocaleKeys.product_add_description_placeholder.tr(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: descriptionValidator,
                    ),
                    CustomTextFormField(
                      controller: priceController,
                      prefixIcon: const Icon(Icons.price_change_outlined),
                      labelText: LocaleKeys.product_add_price.tr(),
                      hintText: LocaleKeys.product_add_price_placeholder.tr(),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.next,
                      validator: priceValidator,
                    ),
                    CustomTextFormField(
                      controller: stockController,
                      prefixIcon: const Icon(Icons.storage_outlined),
                      labelText: LocaleKeys.product_add_stock.tr(),
                      hintText: LocaleKeys.product_add_stock_placeholder.tr(),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.done,
                      validator: stockValidator,
                    ),
                    BlocSelector<ProductAddViewModel, ProductAddState, int?>(
                      selector: (state) {
                        return state.category;
                      },
                      builder: (context, state) {
                        return CustomElevatedButton(
                          onPressed: () async => widget.viewType == ProductViewType.add
                              ? await onPressedCreate(context: context, category: state)
                              : await onPressedEdit(context: context, category: state),
                          child: FlexableLabel(
                            title: widget.viewType == ProductViewType.add
                                ? LocaleKeys.home_add_a_new_product
                                : LocaleKeys.product_update_update_product,
                            isStyleActive: false,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            TransparentScreen<ProductAddViewModel, ProductAddState>(
              child: Assets.lottie.lotLoading.lottie(package: 'gen'),
              selector: (state) => state.isLoading,
            )
          ],
        ),
      ),
    );
  }
}
