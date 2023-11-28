import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Change Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorChangeScreen(),
    );
  }
}

class ColorChangeScreen extends StatefulWidget {
  @override
  _ColorChangeScreenState createState() => _ColorChangeScreenState();
}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  Color _backgroundColor = Colors.white;
  Timer? _colorChangeTimer;

  @override
  void dispose() {
    _colorChangeTimer?.cancel();
    super.dispose();
  }

  void _startColorChangeTimer() {
    // Cancel the existing timer if any
    _colorChangeTimer?.cancel();

    setState(() {
      // Change the background color
      _backgroundColor = Colors.blue;
    });

    // Start a new timer that resets the color after 20 seconds
    _colorChangeTimer = Timer(Duration(seconds: 20), () {
      setState(() {
        _backgroundColor = Colors.white; // Reset to the original color
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Change Timer'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _startColorChangeTimer();
            },
            child: Text('Change Color for 20 Seconds'),
          ),
        ),
      ),
    );
  }
}