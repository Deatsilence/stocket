import 'package:gen/gen.dart';
import 'package:stocket/product/state/base/base_cubit.dart';
import 'package:stocket/product/state/root/root_state.dart';

final class RootViewModel extends BaseCubit<RootState> {
  RootViewModel() : super(RootState(isLoading: false));

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void setCurrentUser({User? user}) {
    emit(state.copyWith(currentUser: user));
  }
}
