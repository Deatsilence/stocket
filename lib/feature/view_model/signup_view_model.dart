import 'dart:developer';

import 'package:gen/gen.dart';
import 'package:stocket/product/service/common_service.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/signup_state.dart';

final class SignUpViewModel extends BaseCubit<SignUpState> {
  SignUpViewModel() : super(SignUpState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> signUp({required User user}) async {
    _changeLoading();
    await Future.delayed(const Duration(seconds: 5))
        // await CommonService.instance
        //     .post<User>(domain: DevEnv().postUsersSignupDomain, model: user)
        .then((value) {
      log('value: ${value.toString()}');
      _changeLoading();
    });
  }
}
