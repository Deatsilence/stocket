import 'package:flutter_bloc/flutter_bloc.dart';

/// [BaseCubit] is the base cubit of all cubits
abstract class BaseCubit<T extends Object> extends Cubit<T> {
  /// Constructor
  BaseCubit(super.initialState);

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
