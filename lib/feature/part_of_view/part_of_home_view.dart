part of '../view/home_view.dart';

final class _ProductItemBuilder extends StatelessWidget {
  final int index;
  final Products products;

  const _ProductItemBuilder({
    required this.index,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    if (index < products.productItems!.length) {
      final _product = products.productItems![index];
      return ProductCard(
        barcode: _product.barcode ?? '',
        description: _product.description ?? '',
        name: _product.name ?? '',
        price: _product.price ?? 0.0,
        stock: _product.stock ?? 0,
        category: _product.category ?? 1,
      );
    }
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
