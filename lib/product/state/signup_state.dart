import 'package:stocket/product/state/base/base_state.dart';

final class SignUpState extends BaseState {
  SignUpState({bool isLoading = false}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => super.props..addAll([]);

  SignUpState copyWith({bool? isLoading}) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
