// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// void main() {
//   runApp(GameApp());
// }
//
// class GameApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Simple Game',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GameScreen(),
//     );
//   }
// }
//
// class GameScreen extends StatefulWidget {
//   @override
//   _GameScreenState createState() => _GameScreenState();
// }
//
// class _GameScreenState extends State<GameScreen> {
//   late AudioCache _audioCache;
//   int _score = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _audioCache = AudioCache(prefix: 'audio/');
//   }
//
//   void _playSound() {
//     _audioCache.play('sound.mp3');
//   }
//
//   void _incrementScore() {
//     setState(() {
//       _score++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: Text('Simple Game'),
//     ),
//     body: Center(
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//     Text(
//     'Score: $_score',
//     style: TextStyle(fontSize: 24),
//     ),
//     SizedBox(height: 20),
//     Image.asset('images/game_image.png', height: 200, width: 200),
//     SizedBox(height: 20),
//     ElevatedButton(
//     onPressed: () {
//     _playSound();
//     _incrementScore();
//     },
//       child: Text('Tap to Play'),
//     ),
//     ],
//     ),
//     ),
//     );
//   }
// }
