import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:stocket/feature/view/widget/custom_snackbar.dart';
import 'package:stocket/feature/view_model/home_view_model.dart';
import 'package:stocket/feature/view_model/root/root_view_model.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/navigation/app_router.dart';
import 'package:stocket/product/state/root/root_state.dart';
import 'package:stocket/product/utility/constants/enums/duration.dart';
import 'package:stocket/product/utility/constants/enums/response_type.dart';
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
                onTap: () => _logout(user: state!),
              ),
              ListTile(
                leading: Icon(Icons.key_outlined),
                title: Text(LocaleKeys.authentication_change_password).tr(),
                onTap: () => _changePassword(context: context, email: state?.email),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _changePassword({required BuildContext context, String? email}) async {
    if (!email.hasValue) {
      CustomSnackbar.show(
        context: context,
        message: LocaleKeys.errors_occur_an_error.tr(),
        second: DurationSeconds.medium,
        responseType: ResponseType.error,
      );
      return;
    }
    var verifyOTP = VerifyOTP(email: email);
    await context.router.push(PasswordResetRoute(
      verifyOTP: verifyOTP,
      islogin: true,
    ));
  }

  Future<void> _logout({User? user}) async {
    if (!user.hasValue) {
      CustomSnackbar.show(
        context: context,
        message: LocaleKeys.authentication_logout_fail.tr(),
        second: DurationSeconds.medium,
        responseType: ResponseType.error,
      );
      return;
    }

    final homeViewModel = widget.homeViewModel;
    if (user!.token.hasValue) {
      await homeViewModel.logout(token: user.token!).then(
        (value) async {
          if (value.isSuccess) {
            // homeViewModel.setThePageAsDefault();
            await context.router.replaceAll([AuthRootRoute()]);
          }
        },
      );
    } else {
      CustomSnackbar.show(
        context: context,
        message: LocaleKeys.authentication_logout_fail.tr(),
        second: DurationSeconds.medium,
        responseType: ResponseType.error,
      );
    }
  }
}
