import 'package:flutter/material.dart';

// Overlay class
class QrCodeOverlay extends CustomPainter{

  final double radius;
  final double radiusWidth;
  final Size sizeOfShape;
  final Color bordersColor;

  QrCodeOverlay({
    required this.radius,
    required this.radiusWidth,
    required this.sizeOfShape,
    required this.bordersColor
  });

  @override
  void paint(Canvas canvas, Size size) {

    final centerPoint = Offset(
        size.width/2,
        size.height/2
    );

    final backgroundPath = _getBackgroundPath(size);

    backgroundPath.addPath(
        _getShapePath(centerPoint),
        Offset.zero
    );

    canvas.drawPath(
        backgroundPath,
        Paint()
          ..color = const Color(0x99292929)
          ..style = PaintingStyle.fill
    );

    canvas.drawPath(
        _getShapeCornersPath(centerPoint),
        Paint()
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..color = bordersColor
          ..strokeWidth += 5
    );
  }

  Path _getBackgroundPath(Size size){
    return Path()
      ..fillType = PathFillType.evenOdd
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);
  }

  Path _getShapePath(Offset center){
    final path = Path();

    path.moveTo(
        (center.dx - sizeOfShape.width/2) + radiusWidth,
        center.dy - sizeOfShape.height/2
    );

    path.lineTo(
        (center.dx + sizeOfShape.width/2) - radiusWidth,
        center.dy - sizeOfShape.height/2
    );

    path.arcToPoint(
        Offset(
            center.dx + sizeOfShape.width/2,
            (center.dy - sizeOfShape.height/2) + radiusWidth
        ),
        radius: Radius.circular(radius)
    );

    path.lineTo(
        center.dx + sizeOfShape.width/2,
        (center.dy + sizeOfShape.height/2) - radiusWidth
    );

    path.arcToPoint(
        Offset(
            (center.dx + sizeOfShape.width/2) - radiusWidth,
            center.dy + sizeOfShape.height/2
        ),
        radius: Radius.circular(radius)
    );

    path.lineTo(
        (center.dx - sizeOfShape.width/2) + radiusWidth,
        center.dy + sizeOfShape.height/2
    );

    path.arcToPoint(
        Offset(
            center.dx - sizeOfShape.width/2,
            (center.dy + sizeOfShape.height/2) - radiusWidth
        ),
        radius: Radius.circular(radius)
    );

    path.lineTo(
        center.dx - sizeOfShape.width/2,
        (center.dy - sizeOfShape.height/2) + radiusWidth
    );

    path.arcToPoint(
        Offset(
            (center.dx - sizeOfShape.width/2) + radiusWidth,
            center.dy - sizeOfShape.height/2
        ),
        radius: Radius.circular(radius)
    );

    return path;
  }

  Path _getShapeCornersPath(Offset center){
    final path = Path();

    path.moveTo(
        (center.dx + sizeOfShape.width/2) - radiusWidth,
        center.dy - sizeOfShape.height/2
    );

    path.arcToPoint(
        Offset(
            center.dx + sizeOfShape.width/2,
            (center.dy - sizeOfShape.height/2) + radiusWidth
        ),
        radius: Radius.circular(radius)
    );

    path.moveTo(
        center.dx + sizeOfShape.width/2,
        (center.dy + sizeOfShape.height/2) - radiusWidth
    );

    path.arcToPoint(
        Offset(
            (center.dx + sizeOfShape.width/2) - radiusWidth,
            center.dy + sizeOfShape.height/2
        ),
        radius: Radius.circular(radius)
    );

    path.moveTo(
        (center.dx - sizeOfShape.width/2) + radiusWidth,
        center.dy + sizeOfShape.height/2
    );

    path.arcToPoint(
        Offset(
            center.dx - sizeOfShape.width/2,
            (center.dy + sizeOfShape.height/2) - radiusWidth
        ),
        radius: Radius.circular(radius)
    );

    path.moveTo(
        center.dx - sizeOfShape.width/2,
        (center.dy - sizeOfShape.height/2) + radiusWidth
    );

    path.arcToPoint(
        Offset(
            (center.dx - sizeOfShape.width/2) + radiusWidth,
            center.dy - sizeOfShape.height/2
        ),
        radius: Radius.circular(radius)
    );

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}