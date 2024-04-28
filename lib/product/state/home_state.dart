import 'package:stocket/product/state/base/base_state.dart';

/// [HomeState] is the state for the home view.
final class HomeState extends BaseState {
  HomeState({bool isLoading = false}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => super.props..addAll([]);

  HomeState copyWith({bool? isLoading}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
