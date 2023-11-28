import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: grapes(),
    );
  }
}
class grapes extends StatelessWidget {
  const grapes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grapes'),
      ),
      body: Center(
        child: CustomPaint(
            painter: drawgrapes(),
            size:Size(300.0,300.0)
        ),
      ),
    );
  }
}

class drawgrapes extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint drawgrape=Paint()
      ..color=Colors.purple
      ..strokeWidth=5.0
      ..style=PaintingStyle.fill;
    canvas.drawCircle(Offset(30.0, 30.0),20.0,drawgrape);
    canvas.drawCircle(Offset(66.0, 30.0),20.0,drawgrape);
    canvas.drawCircle(Offset(105.0, 30.0),20.0,drawgrape);
    canvas.drawCircle(Offset(140.0, 30.0),20.0,drawgrape);
    canvas.drawCircle(Offset(53.0, 65.0),20.0,drawgrape);
    canvas.drawCircle(Offset(88.0, 65.0),20.0,drawgrape);
    canvas.drawCircle(Offset(125.0, 65.0),20.0,drawgrape);
    canvas.drawCircle(Offset(73.0, 100.0),20.0,drawgrape);
    canvas.drawCircle(Offset(110.0, 100.0),20.0,drawgrape);
    canvas.drawCircle(Offset(93.0, 133.0),20.0,drawgrape);

    Paint l=Paint()
      ..style=PaintingStyle.stroke
      ..strokeWidth=8
      ..color=Colors.lightGreen;

    canvas.drawLine(Offset(100.0, -45.0), Offset(86.0, 20.0), l);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
