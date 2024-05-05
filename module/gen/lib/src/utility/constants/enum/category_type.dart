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
}
