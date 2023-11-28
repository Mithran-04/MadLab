import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tea Cup Drawing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TeaCupScreen(),
    );
  }
}

class TeaCupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tea Cup Drawing'),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 300.0,
          child: CustomPaint(
            painter: TeaCupPainter(),
          ),
        ),
      ),
    );
  }
}

class TeaCupPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint cupPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;

    final Paint teaPaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    final Paint handlePaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // Draw the tea cup body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(Offset(50.0, 100.0), Offset(150.0, 300.0)),
        Radius.circular(20.0),
      ),
      cupPaint,
    );

    // Draw the tea inside the cup
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(Offset(60.0, 100.0), Offset(140.0, 290.0)),
        Radius.circular(20.0),
      ),
      teaPaint,
    );

    // Draw the handle of the cup
    Rect handleRect = Rect.fromCircle(center: Offset(150.0, 200.0), radius: 40.0);
    canvas.drawArc(handleRect, -math.pi / 2, math.pi , false, handlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
