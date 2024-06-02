import 'package:stocket/product/state/base/base_state.dart';

final class LoginState extends BaseState {
  LoginState({
    this.isRememberMe = false,
    bool isLoading = false,
  }) : super(isLoading: isLoading);

  final bool isRememberMe;

  @override
  List<Object?> get props => super.props..addAll([isRememberMe]);

  LoginState copyWith({bool? isRememberMe, bool? isLoading}) {
    return LoginState(
      isRememberMe: isRememberMe ?? this.isRememberMe,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
