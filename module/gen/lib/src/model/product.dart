import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'product.g.dart';

/// [Product] is the model for product
@JsonSerializable()
@immutable
final class Product extends BaseModel<Product> with EquatableMixin {
  /// Constructor
  Product({
    this.barcode,
    this.createdat,
    this.description,
    this.category,
    this.name,
    this.price,
    this.productid,
    this.stock,
    this.updatedat,
  });

  /// [barcode] is the barcode of product
  final String? barcode;

  /// [createdat] is the createdat of product
  final String? createdat;

  /// [description] is the description of product
  final String? description;

  /// [category] is the category of product
  final int? category;

  /// [name] is the name of product
  final String? name;

  /// [price] is the price of product
  final double? price;

  /// [productid] is the productid of product
  final String? productid;

  /// [stock] is the stock of product
  final int? stock;

  /// [updatedat] is the updatedat of product
  final String? updatedat;

  @override
  Product fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [
        barcode,
        createdat,
        description,
        category,
        name,
        price,
        productid,
        stock,
        updatedat,
      ];

  /// [copyWith] is a method to create a new instance of [Product] with some modified data
  Product copyWith({
    String? barcode,
    String? createdat,
    String? description,
    int? category,
    String? name,
    double? price,
    String? productid,
    int? stock,
    String? updatedat,
  }) {
    return Product(
      barcode: barcode ?? this.barcode,
      createdat: createdat ?? this.createdat,
      description: description ?? this.description,
      category: category ?? this.category,
      name: name ?? this.name,
      price: price ?? this.price,
      productid: productid ?? this.productid,
      stock: stock ?? this.stock,
      updatedat: updatedat ?? this.updatedat,
    );
  }
}
