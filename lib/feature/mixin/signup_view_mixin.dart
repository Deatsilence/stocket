import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stocket/feature/view/auth/signup_view.dart';
import 'package:stocket/feature/view_model/signup_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

/// [SignUpViewMixin] is a [State] mixin that contains the login view logic.
mixin SignUpViewMixin on State<SignUpView> {
  /// [_signupViewModel] is the view model for the sign up view.
  late final SignUpViewModel _signupViewModel;

  /// [_signupFormKey] is the key for the login form.
  late final GlobalKey<FormState> _signupFormKey;

  /// [_nameController] is the controller for the email text field.
  late final TextEditingController _nameController;

  /// [_surnameController] is the controller for the password text field.
  late final TextEditingController _surnameController;

  /// [_confirmPasswordController] is the controller for the password text field.
  late final TextEditingController _confirmPasswordController;

  /// [signupViewModel] is the view model for the sign up view.
  SignUpViewModel get signupViewModel => _signupViewModel;

  /// [signupFormKey] is the key for the login form.
  GlobalKey<FormState> get signupFormKey => _signupFormKey;

  /// [nameController] is the controller for the email text field.
  TextEditingController get nameController => _nameController;

  /// [surnameController] is the controller for the password text field.
  TextEditingController get surnameController => _surnameController;

  /// [confirmPasswordController] is the controller for the password text field.
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _signupViewModel = SignUpViewModel();
    _signupFormKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// [nameValidator] is validator for name field
  String? nameValidator(String? value) =>
      value.hasValue ? null : LocaleKeys.authentication_name_required.tr();

  /// [surnameValidator] is validator for surname field
  String? surnameValidator(String? value) =>
      value.hasValue ? null : LocaleKeys.authentication_surname_required.tr();

  /// [confirmPasswordValidator] is validator for confirm password field
  String? confirmPasswordValidator(String? value, String password) =>
      value.hasValue && value == password
          ? null
          : LocaleKeys.authentication_password_confirmed.tr();

  bool isSignUpValid() {
    if (_signupFormKey.hasValue && _signupFormKey.currentState!.validate()) {
      _signupFormKey.currentState!.save();
      log('Sign up is valid');
      return true;
    }
    log('Sign up is not valid');
    return false;
  }
}
