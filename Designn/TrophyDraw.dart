import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing Primitives Example'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(200, 250), // Increase the height for the ball
          painter: TrophyPainter(),
        ),
      ),
    );
  }
}

class TrophyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw the trophy body
    paint.color = Colors.brown;
    final trophyBodyRect = Rect.fromPoints(Offset(50, 100), Offset(150, 200));
    canvas.drawRect(trophyBodyRect, paint);

    // Draw the top part of the trophy
    paint.color = Colors.brown;
    final topRect = Rect.fromPoints(Offset(80, 70), Offset(120, 100));
    canvas.drawRect(topRect, paint);

    // Draw the handles on the sides
    paint.color = Colors.grey;
    final handleLeftRect = Rect.fromPoints(Offset(50, 120), Offset(60, 170));
    canvas.drawRect(handleLeftRect, paint);

    final handleRightRect = Rect.fromPoints(Offset(140, 120), Offset(150, 170));
    canvas.drawRect(handleRightRect, paint);



    // Draw the base
    paint.color = Colors.brown;
    // final baseRect = ;
    canvas.drawRect(Rect.fromPoints(Offset(40, 200), Offset(160, 210)), paint);

    // Draw the ball on top
    paint.color = Colors.grey;
    canvas.drawCircle(Offset(100, 50), 20, paint); // Adjusted Offset
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}