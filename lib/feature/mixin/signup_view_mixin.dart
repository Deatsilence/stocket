import 'package:flutter/material.dart';
import 'package:stocket/feature/view/auth/signup_view.dart';

/// [SignUpViewMixin] is a [State] mixin that contains the login view logic.
mixin SignUpViewMixin on State<SignUpView> {
  /// [_nameController] is the controller for the email text field.
  late final TextEditingController _nameController;

  /// [_surnameController] is the controller for the password text field.
  late final TextEditingController _surnameController;

  /// [_confirmPasswordController] is the controller for the password text field.
  late final TextEditingController _confirmPasswordController;

  /// [nameController] is the controller for the email text field.
  TextEditingController get nameController => _nameController;

  /// [surnameController] is the controller for the password text field.
  TextEditingController get surnameController => _surnameController;

  /// [confirmPasswordController] is the controller for the password text field.
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  @override
  void initState() {
    super.initState();
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
}
