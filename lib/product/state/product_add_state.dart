import 'package:stocket/product/state/base/base_state.dart';

final class ProductAddState extends BaseState {
  ProductAddState({this.category, bool isLoading = false}) : super(isLoading: isLoading);

  final int? category;

  @override
  List<Object?> get props => super.props..addAll([category]);

  ProductAddState copyWith({bool? isLoading, int? category}) {
    return ProductAddState(
      isLoading: isLoading ?? this.isLoading,
      category: category ?? this.category,
    );
  }
}
