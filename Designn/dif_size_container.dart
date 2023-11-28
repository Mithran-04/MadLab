import 'package:flutter/material.dart';

void main() {
  runApp(MyContainerApp());
}

class MyContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContainerPage(),
    );
  }
}

class MyContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Sizes Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: Center(
                child: Text('Container 1'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 150,
              height: 150,
              color: Colors.blue,
              child: Center(
                child: Text('Container 2'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
              child: Center(
                child: Text('Container 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}