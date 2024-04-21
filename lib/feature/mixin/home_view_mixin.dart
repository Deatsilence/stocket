import 'package:flutter/material.dart';
import 'package:stocket/feature/view/home_view.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';

/// [HomeViewMixin] is a [State] mixin that contains the home view logic.
mixin HomeViewMixin on State<HomeView> {
  /// [_homeViewModel] is the view model for the login view.
  late final HomeViewModel _homeViewModel;

  /// [homeViewModel] is the view model for the login view.
  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel();
  }
}
