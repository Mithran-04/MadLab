import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomPainter with Border and Fill Example'),
        ),
        body: Center(
          child: CustomPaint(
            size: Size(300, 300),
            painter: MyCustomPainter(),
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Rectangle
    Paint borderPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Paint fillPaint = Paint()..color = Colors.orange;

    canvas.drawRect(Rect.fromLTWH(20, 20, 100, 50), fillPaint);
    canvas.drawRect(Rect.fromLTWH(20, 20, 100, 50), borderPaint);

    // Square
    borderPaint
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    fillPaint..color = Colors.yellow;

    canvas.drawRect(Rect.fromLTWH(150, 20, 50, 50), fillPaint);
    canvas.drawRect(Rect.fromLTWH(150, 20, 50, 50), borderPaint);

    // Circle
    borderPaint
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    fillPaint..color = Colors.lightGreen;

    canvas.drawCircle(Offset(70, 150), 30, fillPaint);
    canvas.drawCircle(Offset(70, 150), 30, borderPaint);

    // Triangle
    borderPaint
      ..color = Colors.purple
      ..style = PaintingStyle.stroke;

    fillPaint..color = Colors.pink;

    Path path = Path()
      ..moveTo(200, 150)
      ..lineTo(250, 200)
      ..lineTo(150, 200)
      ..close();
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);

    // Arc
    borderPaint
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

    fillPaint..color = Colors.yellowAccent;

    Rect rect = Rect.fromCircle(center: Offset(70, 280), radius: 30);
    canvas.drawArc(rect, 0, pi / 2, true, fillPaint); // just pi for semicircle, change the centre coordinates for vertical semicircle
    canvas.drawArc(rect, 0, pi / 2, true, borderPaint);

    // Line
    borderPaint
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(150, 280), Offset(250, 280), borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}