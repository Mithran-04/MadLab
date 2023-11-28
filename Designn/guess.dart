import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GuessingGame(),
    );
  }
}

class GuessingGame extends StatefulWidget {
  @override
  _GuessingGameState createState() => _GuessingGameState();
}

class _GuessingGameState extends State<GuessingGame> {
  int targetNumber=0;
  int guess=0;
  int totalGuesses = 0;
  int maxGuesses = 5;
  Stopwatch stopwatch = Stopwatch();
  Color feedbackColor = Colors.white;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    targetNumber = Random().nextInt(10) + 1; // Random number between 1 and 1
    stopwatch.reset();
    stopwatch.start();
    totalGuesses=0;
  }

  void checkGuess() {
    setState(() {
      totalGuesses++;
      if (guess == targetNumber) {
        win();
      } else {
        // Change color for a short duration
        feedbackColor = guess < targetNumber ? Colors.blue : Colors.red;
        Timer(Duration(milliseconds: 2000), () {
          setState(() {
            feedbackColor = Colors.white;
          });
        });

        if (totalGuesses >= maxGuesses) {
          endGame();
        }
      }
    });
  }

  void endGame() {

    stopwatch.stop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Game Over'),
        content: Column(
          children: [
            Text('Total Guesses: $totalGuesses'),
            Text('Time Spent: ${stopwatch.elapsed.inSeconds} seconds'),
            Text('The correct answer is :${targetNumber}')
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              startGame();
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }
  void win() {
    setState(() {
      feedbackColor=Colors.green;

    });
    Timer(Duration(seconds:2), () {
      setState(() {
        feedbackColor=Colors.white;
      });
    });
    stopwatch.stop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('You guessed it right!!'),
        content: Column(
          children: [
            Text('Total Guesses: $totalGuesses'),
            Text('Time Spent: ${stopwatch.elapsed.inSeconds} seconds'),

          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              startGame();
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: feedbackColor,
      appBar: AppBar(
        title: Text('Guessing Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Guess the Number!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                guess = int.tryParse(value)!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkGuess();
              },
              child: Text('Submit Guess'),
            ),
          ],
        ),
      ),
    );
  }
}