// import 'dart:convert';
// import 'package:flutter/material.dart';
// //import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'News App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: NewsPage(),
//     );
//   }
// }
//
// class NewsPage extends StatefulWidget {
//   @override
//   _NewsPageState createState() => _NewsPageState();
// }
//
// class _NewsPageState extends State<NewsPage> {
//   List<dynamic> articles = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }
//
//   Future<void> fetchNews() async {
//     final apiKey = 'cc99c1493b864d3a8c3275740f5c5b80'; // Replace with your News API key
//     final apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
//
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         setState(() {
//           articles = data['articles'];
//         });
//       } else {
//         throw Exception('Failed to load news');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News App'),
//       ),
//       body: ListView.builder(
//         itemCount: articles.length,
//         itemBuilder: (context, index) {
//           final article = articles[index];
//           return ListTile(
//             title: Text(article['title']),
//             subtitle: Text(article['description']),
//             onTap: () {
//               // Add navigation or additional details if needed
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// // http: ^0.13.3
//
