import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/home_state.dart';

final class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel() : super(HomeState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
