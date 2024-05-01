import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/mixin/home_view_mixin.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view/widget/side_menu.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/state/home_state.dart';

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
    log('${context.router.stack}');
    return BlocProvider<HomeViewModel>(
      create: (context) => homeViewModel,
      child: Stack(
        children: [
          BaseView(
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                await context.router.push(const ProductAddRoute());
              },
              icon: const Icon(Icons.add),
              label: const Text(LocaleKeys.home_add_a_new_product).tr(),
            ),
            drawer: SideMenu(homeViewModel: homeViewModel),
            sliverAppBar: SliverAppBar(),
            onPageBuilder: (context, value) => SliverList(
              delegate: SliverChildListDelegate(
                [],
              ),
            ),
          ),
          TransparentScreen<HomeViewModel, HomeState>(
            child: Assets.lottie.lotLoading.lottie(package: 'gen'),
            selector: (state) => state.isLoading,
          )
        ],
      ),
    );
  }
}
