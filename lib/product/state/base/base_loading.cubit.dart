import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoadingStateFul<T extends Object> extends Cubit<T> {
  LoadingStateFul(super.initialState);

  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    emit(state);
  }
}
