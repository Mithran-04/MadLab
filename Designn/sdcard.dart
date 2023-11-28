// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Movie Review App',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController reviewController = TextEditingController();
//   String savedReview = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Movie Review App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: reviewController,
//               decoration: InputDecoration(labelText: 'Write your movie review'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 saveReviewToFile(reviewController.text);
//               },
//               child: Text('Save Review'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 readReviewFromFile();
//               },
//               child: Text('Read Review'),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               savedReview,
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> saveReviewToFile(String review) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/review.txt');
//     await file.writeAsString(review);
//   }
//
//   Future<void> readReviewFromFile() async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/review.txt');
//       final String contents = await file.readAsString();
//       setState(() {
//         savedReview = contents;
//       });
//     } catch (e) {
//       setState(() {
//         savedReview = 'Error reading the review file';
//       });
//     }
//   }
// }
//
