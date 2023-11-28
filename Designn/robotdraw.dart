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
          title: Text('Flutter Robot Drawing'),
        ),
        body: Center(
          child: RobotWidget(),
        ),
      ),
    );
  }
}

class RobotWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: RobotPainter(),
      ),
    );
  }
}

class RobotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw robot body
    Paint bodyPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    Rect bodyRect = Rect.fromPoints(Offset(50, 100), Offset(150, 200));
    canvas.drawRect(bodyRect, bodyPaint);

    // Draw robot head
    Paint headPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(100, 50), 30, headPaint);

    // Draw robot eyes
    Paint eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(85, 40), 5, eyePaint);
    canvas.drawCircle(Offset(115, 40), 5, eyePaint);

    // Draw robot arms
    Paint armPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromPoints(Offset(20, 120), Offset(50, 180)), armPaint);
    canvas.drawRect(Rect.fromPoints(Offset(150, 120), Offset(180, 180)), armPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
