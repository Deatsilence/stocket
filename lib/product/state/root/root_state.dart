import 'package:gen/gen.dart';
import 'package:stocket/product/state/base/base_state.dart';

final class RootState extends BaseState {
  RootState({this.currentUser, bool isLoading = false}) : super(isLoading: isLoading);

  final User? currentUser;

  @override
  List<Object?> get props => super.props..addAll([currentUser]);

  RootState copyWith({bool? isLoading, User? currentUser}) {
    return RootState(
      isLoading: isLoading ?? this.isLoading,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
