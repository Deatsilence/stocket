import 'package:common/src/decoration/stocket_custom_clipper.dart';
import 'package:flutter/material.dart';

/// [CurvedImage] is a [StatelessWidget] that displays a curved image.
final class CurvedImage extends StatelessWidget {
  const CurvedImage({
    super.key,
    required this.image,
  });

  /// [image] is the image to be displayed.
  final Widget image;

  /// [_height] is the height of the curved image.
  final _height = 100.0;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: StocketCustomClipper(),
      child: SizedBox(
        height: _height,
        child: ColoredBox(
          color: Theme.of(context).primaryColor,
          child: image,
        ),
      ),
    );
  }
}
