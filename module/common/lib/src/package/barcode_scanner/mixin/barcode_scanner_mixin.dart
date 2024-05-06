import 'package:common/src/package/barcode_scanner/index.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// [BarcodeScannerMixin] is a mixin that is used to add the [MobileScannerController] to the [State] of the [Scanner] widget.
mixin BarcodeScannerMixin on State<Scanner> {
  /// [controller] is the [MobileScannerController] that is used to control the [MobileScanner].
  late final MobileScannerController controller;

  /// [animationController] is the [AnimationController] that is used to control the animation of the [Scanner].
  late final AnimationController animationController;

  /// [animation] is the [Animation] that is used to animate the [Scanner].
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }
}
