import 'dart:developer';

import 'package:gen/gen.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/login_state.dart';

final class LoginViewModel extends BaseCubit<LoginState> {
  LoginViewModel() : super(LoginState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
