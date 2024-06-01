import 'package:stocket/product/state/base/base_state.dart';

final class SendToEMailState extends BaseState {
  SendToEMailState({bool isLoading = false}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => super.props..addAll([]);

  SendToEMailState copyWith({bool? isLoading}) {
    return SendToEMailState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
