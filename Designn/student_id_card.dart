//import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
//
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Student ID Card App',
//       home: StudentDetailsForm(),
//     );
//   }
// }
//
// class StudentDetailsForm extends StatefulWidget {
//   @override
//   _StudentDetailsFormState createState() => _StudentDetailsFormState();
// }
//
// class _StudentDetailsFormState extends State<StudentDetailsForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _regNumber = '';
//   String _location = 'Fetching location...';
//
//   @override
//   void initState() {
//     super.initState();
//     _determinePosition();
//   }
//
//   Future<void> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     Position position = await Geolocator.getCurrentPosition();
//     setState(() {
//       _location = "${position.latitude}, ${position.longitude}";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Details Form'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Name'),
//               onSaved: (value) {
//                 _name = value ?? '';
//               },
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter a name';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Registration Number'),
//               onSaved: (value) {
//                 _regNumber = value ?? '';
//               },
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter registration number';
//                 }
//                 return null;
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: Text('Student ID Card'),
//                         content: SingleChildScrollView(
//                           child: ListBody(
//                             children: <Widget>[
//                               Text('Name: $_name'),
//                               Text('Registration Number: $_regNumber'),
//                               Text('Location: $_location'),
//                             ],
//                           ),
//                         ),
//                         actions: <Widget>[
//                           TextButton(
//                             child: Text('Close'),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



//dependencies:
//   flutter:
//     sdk: flutter
//   geolocator: ^10.1.0