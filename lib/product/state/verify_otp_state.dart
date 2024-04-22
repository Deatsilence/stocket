import 'package:stocket/product/state/base/base_state.dart';

final class VerifyOTPState extends BaseState {
  VerifyOTPState({bool isLoading = false}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => super.props..addAll([]);

  VerifyOTPState copyWith({bool? isLoading}) {
    return VerifyOTPState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
