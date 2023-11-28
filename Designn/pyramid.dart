import 'package:flutter/material.dart';

void main() {
  runApp(MyPyramidApp());
}

class MyPyramidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPyramidPage(),
    );
  }
}

class MyPyramidPage extends StatefulWidget {
  @override
  _MyPyramidPageState createState() => _MyPyramidPageState();
}

class _MyPyramidPageState extends State<MyPyramidPage> {
  int _pyramidHeight = 0;
  String _pyramidOutput = '';

  // Function to generate the pyramid pattern
  void _generatePyramid() {
    setState(() {
      _pyramidOutput = '';
      for (int i = 1; i <= _pyramidHeight; i++) {
        for (int j = 0; j < _pyramidHeight - i; j++) {
          _pyramidOutput += '  '; // Add spaces for alignment
        }
        for (int k = 0; k < 2 * i - 1; k++) {
          _pyramidOutput += '* '; // Add asterisks for the pyramid
        }
        _pyramidOutput += '\n'; // Move to the next line after each row
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pyramid App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _pyramidHeight = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(labelText: 'Enter the value of n'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generatePyramid,
              child: Text('Generate Pyramid'),
            ),
            SizedBox(height: 20),
            Text(
              _pyramidOutput,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}