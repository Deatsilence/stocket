import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/state/root/root_state.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

/// [SideMenu] is a [StatefulWidget] that contains the side menu.
final class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocSelector<RootViewModel, RootState, User?>(
        selector: (state) => state.currentUser,
        builder: (context, state) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(state?.name ?? LocaleKeys.errors_occur_an_error.tr()),
                accountEmail: Text(state?.email ?? LocaleKeys.errors_occur_an_error.tr()),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text(LocaleKeys.authentication_logout).tr(),
                onTap: () => _logout(state: state!),
              )
            ],
          );
        },
      ),
    );
  }

  Future<void> _logout({required User state}) async {
    final homeViewModel = widget.homeViewModel;
    if (state.hasValue && state.token.hasValue) {
      await homeViewModel.logout(token: state.token!).then(
        (value) async {
          if (value.isSuccess) {
            homeViewModel.setThePageAsDefault();
            await context.router.replaceAll([AuthRootRoute()]);
          }
        },
      );
    } else {
      // TODO: Snack bar will be customized.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.authentication_logout_fail).tr(),
        ),
      );
    }
  }
}
