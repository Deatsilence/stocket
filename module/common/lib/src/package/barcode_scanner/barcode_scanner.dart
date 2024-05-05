import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      ),
      onDetect: (code) {
        for (var element in code.barcodes) {
          log('Scanned: ${element.rawValue}');
        }
        log('Scanned: $code');
      },
    );
  }
}
