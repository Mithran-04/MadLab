// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Carousel Demo',
//       home: CarouselDemo(),
//     );
//   }
// }
//
// class CarouselDemo extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _CarouselDemoState();
//   }
// }
//
// class _CarouselDemoState extends State<CarouselDemo> {
//   final CarouselController _controller = CarouselController();
//   int _currentIndex = 0;
//   final List<String> imgList = [
//     'https://via.placeholder.com/400/0000FF', // Replace with your image URLs or assets
//     'https://via.placeholder.com/400/FF0000',
//     'https://via.placeholder.com/400/FFFF00'
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(seconds: 5), (Timer timer) {
//       if (_currentIndex < imgList.length - 1) {
//         _currentIndex++;
//       } else {
//         _currentIndex = 0;
//       }
//
//       _controller.animateToPage(
//         _currentIndex,
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Carousel Demo')),
//       body: Center(
//         child: CarouselSlider(
//           options: CarouselOptions(
//             autoPlay: false,
//             enlargeCenterPage: true,
//             viewportFraction: 0.9,
//             aspectRatio: 2.0,
//             initialPage: 2,
//           ),
//           items: imgList
//               .map((item) => Container(
//             child: Center(
//                 child: Image.network(item, fit: BoxFit.cover, width: 1000)),
//           ))
//               .toList(),
//           carouselController: _controller,
//         ),
//       ),
//     );
//   }
// }
//

//dependencies:
//   flutter:
//     sdk: flutter
//   carousel_slider: ^4.2.1