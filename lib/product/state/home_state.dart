import 'package:gen/gen.dart';
import 'package:stocket/product/state/base/base_state.dart';

/// [HomeState] is the state for the home view.
final class HomeState extends BaseState {
  HomeState({bool isLoading = false, List<Product>? products})
      : super(isLoading: isLoading);

  final List<Product> products = [];

  @override
  List<Object?> get props => super.props..addAll([products]);

  HomeState copyWith({bool? isLoading, List<Product>? products}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
    );
  }
}
