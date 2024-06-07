import 'dart:convert';

import 'package:gen/gen.dart';
import 'package:stocket/product/init/cache/cache_manager.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/root/root_state.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

final class RootViewModel extends BaseCubit<RootState> {
  RootViewModel() : super(RootState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void setCurrentUser({User? user}) {
    emit(state.copyWith(currentUser: user));
  }

  void setLogin({Login? login}) {
    emit(state.copyWith(login: login));
  }

  /// [checkSignIn] is the signed in state of home page
  Future<void> checkSignIn() async {
    await CacheManager.instance.checkSignInSP().then(
          (value) => emit(
            state.copyWith(isLogin: value),
          ),
        );
  }

  /// [getDataOfUserFromCache] is the data of user from cache
  Future<({User? user, Login? login})> getDataOfUserFromCache() async {
    if (state.currentUser.hasValue && state.login.hasValue) {
      return (user: state.currentUser, login: state.login);
    }

    Login? login;
    User? user;

    await CacheManager.instance.getLoginDataFromSP().then((value) {
      login = Login().fromJson(jsonDecode(value) as Map<String, dynamic>);
    });

    await CacheManager.instance.getUserDataFromSP().then((value) {
      user = User().fromJson(jsonDecode(value) as Map<String, dynamic>);
    });

    return (user: user, login: login);
  }
}
