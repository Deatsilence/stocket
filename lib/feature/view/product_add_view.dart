import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/feature/mixin/product_add_view_mixin.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view_model/product_add_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/state/product_add_state.dart';
import 'package:stocket/product/utility/extension/padding_extension.dart';

/// [ProductAddView] is main screen of the app
@RoutePage()
final class ProductAddView extends StatefulWidget {
  const ProductAddView({super.key});

  @override
  State<ProductAddView> createState() => _ProductAddViewState();
}

class _ProductAddViewState extends State<ProductAddView> with ProductAddViewMixin {
  @override
  Widget build(BuildContext context) {
    log('${context.router.stack}');
    return BlocProvider<ProductAddViewModel>(
      create: (context) => productAddViewModel,
      child: Form(
        key: productAddFormKey,
        child: Stack(
          children: [
            BaseView(
              physics: AlwaysScrollableScrollPhysics(),
              sliverAppBar: SliverAppBar(
                title: Text(LocaleKeys.home_add_a_new_product).tr(),
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
                      source: CategoryType.names,
                      onChanged: (value) {
                        log('Selected: $value');
                        productAddViewModel.setCategory(category: value);
                      },
                    ),
                    CustomDivider(
                            text: Text(
                      LocaleKeys.product_add_product_information,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr())
                        .onlyPadding(bottom: 2.0.h),
                    CustomTextFormField(
                      controller: barcodeController,
                      prefixIcon: const Icon(Icons.barcode_reader),
                      labelText: LocaleKeys.product_add_barcode.tr(),
                      hintText: LocaleKeys.product_add_barcode_placeholder.tr(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      prefixIcon: const Icon(Icons.shopping_basket_outlined),
                      labelText: LocaleKeys.product_add_name.tr(),
                      hintText: LocaleKeys.product_add_name_placeholder.tr(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: descriptionController,
                      prefixIcon: const Icon(Icons.description_outlined),
                      labelText: LocaleKeys.product_add_description.tr(),
                      hintText: LocaleKeys.product_add_description_placeholder.tr(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: priceController,
                      prefixIcon: const Icon(Icons.price_change_outlined),
                      labelText: LocaleKeys.product_add_price.tr(),
                      hintText: LocaleKeys.product_add_price_placeholder.tr(),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: stockController,
                      prefixIcon: const Icon(Icons.storage_outlined),
                      labelText: LocaleKeys.product_add_stock.tr(),
                      hintText: LocaleKeys.authentication_email_placeholder.tr(),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    BlocSelector<ProductAddViewModel, ProductAddState, int?>(
                      selector: (state) {
                        return state.category;
                      },
                      builder: (context, state) {
                        return CustomElevatedButton(
                          onPressed: () => onPressed(state: state),
                          child: Text(LocaleKeys.product_add_save_product).tr(),
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
