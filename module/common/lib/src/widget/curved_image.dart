import 'package:common/src/decoration/stocket_custom_clipper.dart';
import 'package:flutter/material.dart';

/// [CurvedImage] is a [StatelessWidget] that displays a curved image.
final class CurvedImage extends StatelessWidget {
  final String imagePath;

  const CurvedImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: StocketCustomClipper(),
      child: Image.network(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 250, // Set this height to your preference
      ),
    );
  }
}
