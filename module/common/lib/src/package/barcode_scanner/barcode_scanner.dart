import 'package:common/src/package/barcode_scanner/mixin/barcode_scanner_mixin.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// [Scanner] is a widget that is used to scan barcodes.
final class Scanner extends StatefulWidget {
  const Scanner({
    super.key,
    this.onDetect,
  });

  final Function(BarcodeCapture barcodes)? onDetect;

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner>
    with BarcodeScannerMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: controller,
      onDetect: widget.onDetect,
      overlayBuilder: (context, constraints) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final position = constraints.maxHeight * 0.4 +
                (animation.value * constraints.maxHeight * 0.2);
            return Stack(
              children: [
                Container(
                  color: Colors.black.withOpacity(0.5),
                ),
                Center(
                  child: CustomPaint(
                    painter: _CornerBoxPainter(),
                    child: SizedBox(
                      width: constraints.maxWidth * 0.8,
                      height: constraints.maxHeight * 0.2,
                    ),
                  ),
                ),
                Positioned(
                  top: position,
                  left: constraints.maxWidth * 0.2,
                  right: constraints.maxWidth * 0.2,
                  child: Container(
                    height: 3,
                    color: Colors.red,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

final class _CornerBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Corner box length
    double cornerLength = 30;

    Path path = Path();

    // Top left corner
    path.moveTo(0, cornerLength);
    path.lineTo(0, 0);
    path.lineTo(cornerLength, 0);

    // Top right corner
    path.moveTo(size.width - cornerLength, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, cornerLength);

    // Bottom left corner
    path.moveTo(0, size.height - cornerLength);
    path.lineTo(0, size.height);
    path.lineTo(cornerLength, size.height);

    // Bottom right corner
    path.moveTo(size.width - cornerLength, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - cornerLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
