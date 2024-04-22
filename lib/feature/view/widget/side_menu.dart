import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/state/root/root_state.dart';

/// [SideMenu] is a [StatefulWidget] that contains the side menu.
final class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          BlocSelector<RootViewModel, RootState, User?>(
            selector: (state) {
              return state.currentUser;
            },
            builder: (context, state) {
              return UserAccountsDrawerHeader(
                accountName: Text(state?.name ?? 'occur an error'),
                accountEmail: Text(state?.email ?? 'occur an error'),
              );
            },
          )
        ],
      ),
    );
  }
}
