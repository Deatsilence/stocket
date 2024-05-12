import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'products.g.dart';

/// [Products] is the model for products
@JsonSerializable()
final class Products extends BaseModel<Products> with EquatableMixin {
  final List<Product>? productItems;
  final int? totalCount;

  Products({
    this.productItems,
    this.totalCount,
  });

  @override
  Products fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  @override
  List<Object?> get props => [productItems, totalCount];

  Products copyWith({
    List<Product>? productItems,
    int? totalCount,
  }) {
    return Products(
      productItems: productItems ?? this.productItems,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}
