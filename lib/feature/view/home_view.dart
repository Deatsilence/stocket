import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/mixin/home_view_mixin.dart';
import 'package:stocket/feature/view/widget/index.dart';
import 'package:stocket/feature/view/widget/side_menu.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
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
    return BlocProvider<HomeViewModel>(
      create: (context) => homeViewModel,
      child: Stack(
        children: [
          BaseView(
            drawer: SideMenu(),
            sliverAppBar: SliverAppBar(),
            onPageBuilder: (context, value) => SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text('Home View'),
                ],
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
