// In a fitness app, how could you implement a side menu allowing users to navigate between sections like workouts, progress, and settings using Flutter?
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const FitnessApp());
// }
//
// class FitnessApp extends StatelessWidget {
//   const FitnessApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fitness App',
//       home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fitness App'),
//       ),
//       drawer: const AppDrawer(),
//       body: const Center(
//         child: Text('Welcome to the Fitness App!'),
//       ),
//     );
//   }
// }
//
// class AppDrawer extends StatelessWidget {
//   const AppDrawer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.red,
//             ),
//             child: Text(
//               'Fitness App Menu',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             title: const Text('Workouts'),
//             onTap: () {
//               // Navigate to the workouts section
//               Navigator.pop(context);
//               // You can navigate to a specific screen here
//             },
//           ),
//           ListTile(
//             title: const Text('Progress'),
//             onTap: () {
//               // Navigate to the progress section
//               Navigator.pop(context);
//               // You can navigate to a specific screen here
//             },
//           ),
//           ListTile(
//             title: const Text('Settings'),
//             onTap: () {
//               // Navigate to the settings section
//               Navigator.pop(context);
//               // You can navigate to a specific screen here
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }