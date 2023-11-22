import 'package:flutter/material.dart';

class DrawingCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],),
          child: CustomPaint(
            painter: ShapesPainter(),
          ),),
    ),
    );}
}
class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.5), 50, circlePaint);
    final rectPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromPoints(Offset(size.width * 0.4, size.height * 0.3), Offset(size.width * 0.6, size.height * 0.7)), rectPaint);
    final linePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawLine(Offset(size.width * 0.8, size.height * 0.4), Offset(size.width * 0.8, size.height * 0.6), linePaint);
    final RectPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    final path=Path();
    path.moveTo(size.width*1/2,size.height*1/4);
    path.lineTo(size.width*1/6,size.height*3/6);
    path.lineTo(size.width*5/7,size.height*1/6);
    path.close();

    canvas.drawPath(path,linePaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
