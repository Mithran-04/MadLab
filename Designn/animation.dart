// Animation:
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const AnimationApp());
// }
//
// class AnimationApp extends StatelessWidget {
//   const AnimationApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Animation App',
//       home: const AnimationScreen(),
//     );
//   }
// }
//
// class AnimationScreen extends StatefulWidget {
//   const AnimationScreen({Key? key}) : super(key: key);
//
//   @override
//   _AnimationScreenState createState() => _AnimationScreenState();
// }
//
//
// class _AnimationScreenState extends State<AnimationScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Set up the animation controller
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//
//     // Set up the animation to move the widget from left to right
//     _offsetAnimation = Tween<Offset>(
//       begin: Offset.zero,
//       end: const Offset(2.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.linear,
//     ));
//
//     // Start the animation
//     _controller.repeat(reverse: true);
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the animation controller
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Animation App'),
//       ),
//       body: Center(
//         child: SlideTransition(
//           position: _offsetAnimation,
//           child: Container(
//             width: 50,
//             height: 50,
//             color: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }