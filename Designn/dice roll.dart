import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DiceRollerApp());
}

class DiceRollerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceRollerPage(),
    );
  }
}

class DiceRollerPage extends StatefulWidget {
  @override
  _DiceRollerPageState createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage> {
  int _diceResult = 1;

  void _rollDice() {
    setState(() {
      // Generate a random number between 1 and 6
      _diceResult = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dice Result:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              '$_diceResult',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _rollDice,
              child: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}