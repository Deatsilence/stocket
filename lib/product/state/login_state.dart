import 'package:stocket/product/state/base/base_state.dart';

final class LoginState extends BaseState {
  LoginState({bool isLoading = false}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => super.props..addAll([]);

  LoginState copyWith({bool? isLoading}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
