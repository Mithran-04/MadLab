// // import 'dart:async';
// // import 'dart:math';
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(GuessingGameApp());
// // }
// //
// // class GuessingGameApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Guessing Game',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: GuessingGameScreen(),
// //     );
// //   }
// // }
// //
// // class GuessingGameScreen extends StatefulWidget {
// //   @override
// //   _GuessingGameScreenState createState() => _GuessingGameScreenState();
// // }
// //
// // class _GuessingGameScreenState extends State<GuessingGameScreen> {
// //   late int targetNumber;
// //   int totalGuesses = 0;
// //   Color guessColor = Colors.white;
// //   bool isCorrect = false;
// //   TextEditingController _controller = TextEditingController();
// //   Timer? _colorTimer;
// //   DateTime startTime = DateTime.now();
// //   DateTime? endTime;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     targetNumber = Random().nextInt(100) + 1;
// //     print(targetNumber); // For debugging purposes
// //   }
// //
// //   void checkGuess() {
// //     int userGuess = int.tryParse(_controller.text) ?? 0;
// //     bool isCorrect = userGuess == targetNumber;
// //     setState(() {
// //       totalGuesses++;
// //       guessColor = isCorrect ? Colors.green : Colors.red;
// //       if (_colorTimer != null && _colorTimer!.isActive) {
// //         _colorTimer!.cancel();
// //       }
// //       _colorTimer = Timer(Duration(milliseconds: 200), () {
// //         setState(() {
// //           guessColor = Colors.white;
// //         });
// //       });
// //       if (totalGuesses >= 5 || isCorrect) {
// //         endTime = DateTime.now();
// //         showResults();
// //       }
// //     });
// //   }
// //
// //   void showResults() {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text('Game Over'),
// //           content: Text(
// //               'You ${isCorrect ? 'guessed' : 'did not guess'} the correct number.\n'
// //                   'Total guesses: $totalGuesses\n'
// //                   'Time spent: ${endTime!.difference(startTime).inSeconds} seconds.'),
// //           actions: [
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //                 resetGame();
// //               },
// //               child: Text('Play Again'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   void resetGame() {
// //     setState(() {
// //       targetNumber = Random().nextInt(100) + 1;
// //       print(targetNumber); // For debugging purposes
// //       totalGuesses = 0;
// //       guessColor = Colors.white;
// //       startTime = DateTime.now();
// //       endTime = null;
// //       _controller.clear();
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     _colorTimer?.cancel();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Guessing Game'),
// //       ),
// //       body: Container(
// //         padding: EdgeInsets.all(16.0),
// //         color: guessColor, // Changed to use the guessColor
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               'Guess the number between 1 and 100:',
// //               style: TextStyle(fontSize: 18),
// //             ),
// //             TextField(
// //               controller: _controller,
// //               keyboardType: TextInputType.number,
// //               decoration: InputDecoration(labelText: 'Your Guess'),
// //               onSubmitted: (_) => checkGuess(), // Added for convenience
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: checkGuess,
// //               child: Text('Check Guess'),
// //             ),
// //             if (endTime != null) ...[ // Display the time spent and total guesses after game over
// //               Text('Total guesses: $totalGuesses'),
// //               Text('Time spent: ${endTime!.difference(startTime).inSeconds} seconds'),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// Implement a guessing game gets a guess from the user. If the guess is too big, or too small it should change into diff colors but the color should be there only for 20 milliseconds and should revert back to the normal color again. I should also show the total num of times a user takes to guess and max is 5. It should also show how much time an user spent in this game at last.
// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(GuessingGameApp());
// }
//
// class GuessingGameApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Guessing Game',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GuessingGameScreen(),
//     );
//   }
// }
//
// class GuessingGameScreen extends StatefulWidget {
//   @override
//   _GuessingGameScreenState createState() => _GuessingGameScreenState();
// }
//
// class _GuessingGameScreenState extends State<GuessingGameScreen> {
//   late int targetNumber;
//   int totalGuesses = 0;
//   int maxGuesses = 5;
//   bool isCorrect = false;
//   bool isGameOver = false;
//   late DateTime startTime;
//   late DateTime endTime;
//   TextEditingController _controller = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // Generate a random number between 1 and 100
//     targetNumber = Random().nextInt(100) + 1;
//     print(targetNumber);
//     startTime = DateTime.now();
//   }
//
//   void checkGuess() {
//     if (!isGameOver) {
//       int userGuess = int.tryParse(_controller.text) ?? 0;
//       setState(() {
//         totalGuesses++;
//         isCorrect = userGuess == targetNumber;
//
//         if (isCorrect || totalGuesses >= maxGuesses) {
//           isGameOver = true;
//           endTime = DateTime.now();
//           showResults();
//         } else {
//           // Change color for 20 milliseconds
//           // Timer(Duration(milliseconds: 20), () {
//           //   if (mounted) {
//           //     isCorrect = false;
//           //     _controller.clear();
//           //   }
//           // });
//         }
//       });
//     }
//   }
//
//   void showResults() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Game Over'),
//           content: Column(
//             children: [
//               Text(isCorrect
//                   ? 'Congratulations! You guessed the correct number.'
//                   : 'Sorry, you ran out of guesses.'),
//               SizedBox(height: 10),
//               Text('Total Guesses: $totalGuesses'),
//               Text('Time Spent: ${endTime.difference(startTime).inSeconds} seconds'),
//             ],
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 resetGame();
//               },
//               child: Text('Play Again'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void resetGame() {
//     setState(() {
//       targetNumber = Random().nextInt(100) + 1;
//       print(targetNumber);
//       totalGuesses = 0;
//       isCorrect = false;
//       isGameOver = false;
//       startTime = DateTime.now();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Guessing Game'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         color: isCorrect ? Colors.blue : Colors.red,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Guess the number between 1 and 100:',
//               style: TextStyle(fontSize: 18),
//             ),
//             TextField(
//               controller: _controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Your Guess'),
//               // enabled: !isGameOver,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 checkGuess();
//               },
//               child: Text('Check Guess'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }