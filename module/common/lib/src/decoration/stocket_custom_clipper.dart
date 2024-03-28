import 'package:flutter/material.dart';

///[StocketCustomClipper] is a custom clipper for the stocket
final class StocketCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // Start from the top left corner

    // Define the point for the end of the curve
    var firstControlPoint = Offset(size.width / 2, size.height);
    // Define the point for the end of the curve
    var firstEndPoint = Offset(size.width, size.height - 50);
    // Add a quadratic bezier curve
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0); // Move to the top right corner
    path.close(); // Close the path (connects the current point back to the first point)
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
