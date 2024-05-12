import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';

@RoutePage<String>()
final class BarcodeScannerView extends StatelessWidget {
  const BarcodeScannerView({
    super.key,
    this.onDetect,
  });

  final void Function(String code)? onDetect;

  @override
  Widget build(BuildContext context) {
    return Scanner(
      onDetect: (barcodes) async {
        var barcode = barcodes.barcodes.last.rawValue ?? '';
        if (barcode.hasValue) {
          onDetect?.call(barcode);
          await context.router.maybePop<String>(barcode);
        }
      },
    );
  }
}
