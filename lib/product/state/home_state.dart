import 'package:gen/gen.dart';
import 'package:stocket/product/state/base/base_state.dart';

/// [HomeState] is the state for the home view.
final class HomeState extends BaseState {
  HomeState({this.products, bool isLoading = false}) : super(isLoading: isLoading);

  final Products? products;

  @override
  List<Object?> get props => super.props..addAll([products]);

  HomeState copyWith({bool? isLoading, Products? products}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
    );
  }
}
