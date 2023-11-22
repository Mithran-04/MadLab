import 'package:flutter/material.dart';
import 'dart:math';


class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _diceValue = 1;

  void _rollDice() {
    setState(() {
      _diceValue = Random().nextInt(6) + 1;
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
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  '$_diceValue',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(height: 20),
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
