import 'package:flutter/material.dart';

/// [CategoryType] is an enum class that represents the category type of the product.
enum CategoryType {
  stationary,
  electronics,
  books,
  food,
  drinks,
  other;

  /// [name] is used to get the name of the category type.
  static List<String> get names => [
        'Stationary',
        'Electronics',
        'Books',
        'Food',
        'Drinks',
        'Other',
      ];

  /// [value] is used to get the value of the category type.
  static int getValue({required int index}) {
    switch (index) {
      case 0:
        return CategoryType.stationary.index;
      case 1:
        return CategoryType.electronics.index;
      case 2:
        return CategoryType.books.index;
      case 3:
        return CategoryType.food.index;
      case 4:
        return CategoryType.drinks.index;
      case 5:
        return CategoryType.other.index;
      default:
        return CategoryType.other.index;
    }
  }

  /// [getIconAccordingToCategory] is used to get the icon according to the category type.
  static IconData getIconAccordingToCategory({required int index}) {
    if (index case 1)
      return Icons.book_outlined;
    else if (index case 2)
      return Icons.electric_bolt_sharp;
    else if (index case 4)
      return Icons.fastfood;
    else if (index case 5)
      return Icons.local_drink;
    else if (index case 6)
      return Icons.category;
    else
      return Icons.category;
  }
}
