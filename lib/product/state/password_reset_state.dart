import 'package:stocket/product/state/base/base_state.dart';

final class PasswordResetState extends BaseState {
  PasswordResetState({bool isLoading = false}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => super.props..addAll([]);

  PasswordResetState copyWith({bool? isLoading}) {
    return PasswordResetState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
