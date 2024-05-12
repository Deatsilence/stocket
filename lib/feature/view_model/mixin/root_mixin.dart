import 'package:flutter/material.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';

/// [RootMixin] is a [State] mixin that contains the root state logic.
mixin RootMixin<T extends StatefulWidget> on State<T> {
  /// [_rootViewModel] is the view model for the login view.
  late final RootViewModel _rootViewModel;

  /// [rootViewModel] is the view model for the login view.
  RootViewModel get rootViewModel => _rootViewModel;

  @override
  void initState() {
    super.initState();
    _rootViewModel = RootViewModel();
  }
}
