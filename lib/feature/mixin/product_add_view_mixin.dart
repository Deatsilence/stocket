import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/product_add_view.dart';
import 'package:stocket/feature/view_model/product_add_view_model.dart';

/// [ProductAddViewMixin] is a [State] mixin that contains the home view logic.
mixin ProductAddViewMixin on State<ProductAddView> {
  /// [_productAddFormKey] is the key for the login form.
  late final GlobalKey<FormState> _productAddFormKey;

  /// [_productAddViewModel] is the view model for the login view.
  late final ProductAddViewModel _productAddViewModel;

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
    _barcodeController = TextEditingController();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _stockController = TextEditingController();
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

  Future<void> onPressedCreateProduct({required int? category}) async {
    final product = Product(
      barcode: "444444444",
      name: "mouse",
      description: "mouse description",
      category: category,
      price: 4000,
      stock: 10,
    );
    await productAddViewModel.createProduct(product: product);
  }
}
