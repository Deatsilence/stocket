import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:sizer/sizer.dart';
import 'package:stocket/feature/view/widget/row_label.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/utility/extension/list_gutter_extension.dart';

/// [ProductCard] is a [StatelessWidget] that displays the product card.
final class ProductCard extends StatelessWidget {
  final String barcode;
  final String description;
  final String name;
  final double price;
  final int stock;
  final int category;

  const ProductCard({
    required this.barcode,
    required this.description,
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingManager.paddingManagerLessPaddingAll,
      child: Padding(
        padding: PaddingManager.paddingManagerLessPaddingAll,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.5.h),
              ...[
                RowLabel(
                  firstText: LocaleKeys.product_add_barcode.tr(),
                  secondText: barcode,
                ),
                RowLabel(
                  firstText: LocaleKeys.product_add_description.tr(),
                  secondText: description,
                ),
                RowLabel(
                  firstText: LocaleKeys.product_add_price.tr(),
                  secondText: '\$${price.toStringAsFixed(2)}',
                ),
                RowLabel(
                  firstText: LocaleKeys.product_add_stock.tr(),
                  secondText: stock.toString(),
                ),
              ].seperate(space: 1.h),
            ],
          ),
          leading: Icon(
            CategoryType.getIconAccordingToCategory(index: category),
            size: 50,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
