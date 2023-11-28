import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snowman Drawing'),
        ),
        body: Center(
          child: SnowmanWidget(),
        ),
      ),
    );
  }
}

class SnowmanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SnowmanPainter(),
      size: Size(200, 300), // Adjust the size as needed
    );
  }
}

class SnowmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw the snowman with circles
    final Paint paint = Paint()
      ..color = Colors.blue // Change the color as needed
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;

    // Draw the body of the snowman
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.8), 40, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.6), 30, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.4), 20, paint);

    // Draw the eyes
    paint.color = Colors.black; // Change the color as needed
    canvas.drawCircle(Offset(size.width / 2 - 10, size.height * 0.38), 2, paint);
    canvas.drawCircle(Offset(size.width / 2 + 10, size.height * 0.38), 2, paint);

    // Draw the nose
    paint.color = Colors.orange; // Change the color as needed
    canvas.drawPath(
      Path()
        ..moveTo(size.width / 2 - 5, size.height * 0.42)
        ..lineTo(size.width / 2 + 5, size.height * 0.42)
        ..lineTo(size.width / 2, size.height * 0.45)
        ..close(),
      paint,
    );

    // Draw the mouth
    paint.color = Colors.black; // Change the color as needed
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height * 0.4), radius: 15),
      0.3,
      2.4,
      false,
      paint,
    );

    // Draw arms
    paint.color = Colors.brown; // Change the color as needed
    canvas.drawLine(
      Offset(size.width / 2 - 20, size.height * 0.6),
      Offset(size.width / 2 - 50, size.height * 0.6),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2 + 20, size.height * 0.6),
      Offset(size.width / 2 + 50, size.height * 0.6),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
