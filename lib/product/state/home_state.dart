import 'package:gen/gen.dart';
import 'package:stocket/product/state/base/base_state.dart';

/// [HomeState] is the state for the home view.
final class HomeState extends BaseState {
  HomeState({this.products, this.page = 1, bool isLoading = false})
      : super(isLoading: isLoading);

  final Products? products;

  final int page;

  @override
  List<Object?> get props => super.props..addAll([products, page]);

  HomeState copyWith({bool? isLoading, Products? products, int? page}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      page: page ?? this.page,
    );
  }
}
