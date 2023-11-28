import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(GuessingGameApp());
}

class GuessingGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guessing Game',
      home: GuessingGameScreen(),
    );
  }
}

class GuessingGameScreen extends StatefulWidget {
  @override
  _GuessingGameScreenState createState() => _GuessingGameScreenState();
}

class _GuessingGameScreenState extends State<GuessingGameScreen> {
  final _randomNumber = Random().nextInt(100) + 1; // Random number between 1 and 100
  final _guessController = TextEditingController();
  Color _backgroundColor = Colors.red;
  String _message = '';

  void _checkGuess() {
    if (int.tryParse(_guessController.text) == _randomNumber) {
      setState(() {
        _backgroundColor = Colors.blue;
        _message = 'Correct! The number was $_randomNumber.';
      });
    } else {
      setState(() {
        _backgroundColor = Colors.red;
        _message = 'Try again!';
      });
    }
    _guessController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('Guess the Number'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'I\'m thinking of a number between 1 and 100.',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _guessController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your guess',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkGuess,
              child: Text('Guess'),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
