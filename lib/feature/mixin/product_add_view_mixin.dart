import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/product_add_view.dart';
import 'package:stocket/feature/view_model/product_add_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

/// [ProductAddViewMixin] is a [State] mixin that contains the home view logic.
mixin ProductAddViewMixin on State<ProductAddView> {
  /// [_productAddFormKey] is the key for the login form.
  late final GlobalKey<FormState> _productAddFormKey;

  /// [_productAddViewModel] is the view model for the login view.
  late final ProductAddViewModel _productAddViewModel;

  /// [_productid] is the _productid of the product.
  late final String _productid;

  /// [_category] is the _category of the product.
  late final int _category;

  /// [_barcodeController] is the controller for the barcode field.
  late final TextEditingController _barcodeController;

  /// [_nameController] is the controller for the name field.
  late final TextEditingController _nameController;

  /// [_descriptionController] is the controller for the description field.
  late final TextEditingController _descriptionController;

  /// [_priceController] is the controller for the price field.
  late final TextEditingController _priceController;

  /// [_stockController] is the controller for the stock field.
  late final TextEditingController _stockController;

  /// [productAddFormKey] is the key for the login form.
  GlobalKey<FormState> get productAddFormKey => _productAddFormKey;

  /// [productAddViewModel] is the view model for the login view.
  ProductAddViewModel get productAddViewModel => _productAddViewModel;

  /// [productid] is the productid of the product.
  String get productid => _productid;

  /// [category] is the category of the product.
  int get category => _category;

  /// [barcodeController] is the controller for the barcode field.
  TextEditingController get barcodeController => _barcodeController;

  /// [nameController] is the controller for the name field.
  TextEditingController get nameController => _nameController;

  /// [descriptionController] is the controller for the description field.
  TextEditingController get descriptionController => _descriptionController;

  /// [priceController] is the controller for the price field.
  TextEditingController get priceController => _priceController;

  /// [stockController] is the controller for the stock field.
  TextEditingController get stockController => _stockController;

  @override
  void initState() {
    super.initState();
    _productAddFormKey = GlobalKey<FormState>();
    _productAddViewModel = ProductAddViewModel();
    _productid = widget.product?.productid ?? '';
    _category = widget.product?.category ?? CategoryType.stationary.index + 1;
    _barcodeController = TextEditingController();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _stockController = TextEditingController();

    _barcodeController.text = widget.product?.barcode ?? '';
    _nameController.text = widget.product?.name ?? '';
    _descriptionController.text = widget.product?.description ?? '';
    _priceController.text = widget.product?.price.toString() ?? '';
    _stockController.text = widget.product?.stock.toString() ?? '';

    productAddViewModel.setCategory(category: _category);
  }

  @override
  void dispose() {
    _barcodeController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  /// [barcodeValidator] is validator for surname field
  String? barcodeValidator(String? value) =>
      value.hasValue ? null : LocaleKeys.product_add_barcode_required.tr();

  /// [nameValidator] is validator for name field
  String? nameValidator(String? value) =>
      value.hasValue && (value!.length >= 2 && value.length <= 50)
          ? null
          : LocaleKeys.product_add_name_required.tr();

  /// [descriptionValidator] is validator for description field
  String? descriptionValidator(String? value) =>
      value.hasValue && (value!.length >= 2 && value.length <= 100)
          ? null
          : LocaleKeys.product_add_description_required.tr();

  /// [priceValidator] is validator for price field
  String? priceValidator(String? value) =>
      value.hasValue && double.tryParse(value!) != null
          ? null
          : LocaleKeys.product_add_price_required.tr();

  /// [stockValidator] is validator for stock field
  String? stockValidator(String? value) => value.hasValue && int.tryParse(value!) != null
      ? null
      : LocaleKeys.product_add_stock_required.tr();

  bool isAddingProductValid() {
    if (_productAddFormKey.hasValue && _productAddFormKey.currentState!.validate()) {
      _productAddFormKey.currentState!.save();
      log('Adding a product is valid');
      return true;
    }
    log('Adding a product is not valid');
    return false;
  }

  Future<void> onPressedCreateProduct({
    required int? category,
    required String token,
  }) async {
    final product = Product(
      barcode: barcodeController.text,
      name: "keyboard",
      description: "keyboard description",
      category: category,
      price: 999,
      stock: 230,
    );
    if (!token.hasValue) {
      // TODO: Show error alert
    }
    await productAddViewModel.createProduct(product: product, token: token).then((value) {
      if (value.isSuccess) {
        // TODO : Show success alert
        context.router.maybePop<bool?>(true);
      } else {
        null;
      }
    });
  }

  Future<void> onPressedEditProduct({
    required int? category,
    required String token,
  }) async {
    final product = Product(
      productid: productid,
      barcode: barcodeController.text,
      name: nameController.text,
      description: descriptionController.text,
      category: category,
      price: double.tryParse(priceController.text) ?? 0.0,
      stock: int.tryParse(stockController.text) ?? 0,
    );
    if (!token.hasValue) {
      // TODO: Show error alert
    }
    await productAddViewModel.editProduct(product: product, token: token).then((value) {
      if (value.isSuccess) {
        // TODO : Show success alert
        log('Product edited');
        // context.router.maybePop<bool?>(true);
      } else {
        log('Product not edited');
        null;
      }
    });
  }

  Future<void> onPressedCreate({required int? category}) async {
    if (isAddingProductValid()) {
      final token = context.read<RootViewModel>().state.currentUser?.token;
      await onPressedCreateProduct(
        category: category,
        token: token ?? '',
      );
    }
  }

  Future<void> onPressedEdit({required int? category}) async {
    if (isAddingProductValid()) {
      final token = context.read<RootViewModel>().state.currentUser?.token;
      await onPressedEditProduct(
        category: category,
        token: token ?? '',
      );
    }
  }

  Future<void> onPressedNavigateToBarcodeScan() async {
    var barcode = await context.router.push<String>(
      BarcodeScannerRoute(),
    );
    barcodeController.text = barcode ?? '';
  }
}
