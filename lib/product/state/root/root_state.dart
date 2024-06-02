import 'package:gen/gen.dart';
import 'package:stocket/product/state/base/base_state.dart';

final class RootState extends BaseState {
  RootState({
    this.currentUser,
    this.login,
    this.isLogin = false,
    bool isLoading = false,
  }) : super(isLoading: isLoading);

  final User? currentUser;
  final Login? login;
  final bool isLogin;

  @override
  List<Object?> get props => super.props..addAll([currentUser, isLogin, login]);

  RootState copyWith({bool? isLoading, User? currentUser, bool? isLogin, Login? login}) {
    return RootState(
      isLoading: isLoading ?? this.isLoading,
      currentUser: currentUser ?? this.currentUser,
      login: login ?? this.login,
      isLogin: isLogin ?? this.isLogin,
    );
  }
}
