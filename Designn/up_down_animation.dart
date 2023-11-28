import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContainerAnimationPage(),
    );
  }
}

class ContainerAnimationPage extends StatefulWidget {
  @override
  _ContainerAnimationPageState createState() => _ContainerAnimationPageState();
}

class _ContainerAnimationPageState extends State<ContainerAnimationPage> {
  double containerPosition = 0.0;

  void _toggleContainerPosition() {
    setState(() {
      containerPosition = containerPosition == 0.0 ? 150.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Animation'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(top: containerPosition),
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
          child: Center(
            child: Text(
              'Up and Down',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleContainerPosition,
        tooltip: 'Toggle Animation',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
