import 'package:flutter/material.dart';

void main() {
  runApp(PyramidApp());
}

class PyramidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pyramid App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PyramidScreen(),
    );
  }
}

class PyramidScreen extends StatefulWidget {
  @override
  _PyramidScreenState createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {
  final TextEditingController _controller = TextEditingController();
  String _pyramid = '';

  void _generatePyramid(int height) {
    setState(() {
      _pyramid = '';
      for (int i = 0; i < height; i++) {
        _pyramid += ' ' * (height - i - 1) + '*' * (2 * i + 1) + '\n';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pyramid Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter pyramid height',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final int? height = int.tryParse(_controller.text);
                if (height != null) {
                  _generatePyramid(height);
                }
              },
              child: Text('Generate Pyramid'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_pyramid),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
