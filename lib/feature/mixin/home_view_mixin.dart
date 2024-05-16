import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/home_view.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';

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
    final token = context.read<RootViewModel>().state.currentUser?.token ?? '';
    _homeViewModel.getProducts(token: token).then(
          (value) => _homeViewModel.setProducts(
            products: value.isSuccess ? value.data as Products : Products(),
          ),
        );
  }
}
