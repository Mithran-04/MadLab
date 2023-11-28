import 'package:flutter/material.dart';

void main() {
  runApp(MyRotationAnimationApp());
}

class MyRotationAnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyRotationAnimationPage(),
    );
  }
}

class MyRotationAnimationPage extends StatefulWidget {
  @override
  _MyRotationAnimationPageState createState() => _MyRotationAnimationPageState();
}

class _MyRotationAnimationPageState extends State<MyRotationAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(); // Use repeat to make the animation continuous

    _animation = Tween<double>(
      begin: 0,
      end: 360,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotation Animation'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}