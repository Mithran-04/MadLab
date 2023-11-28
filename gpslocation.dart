// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'OpenStreetMap Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
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
//   late MapController mapController;
//   List<Marker> markers = [];
//   LatLng? currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     mapController = MapController();
//     _determinePosition();
//   }
//
//   void _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Check if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled; don't continue accessing the position and inform the user.
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied; don't continue.
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever; handle appropriately.
//       return Future.error('Location permissions are permanently denied; we cannot request permissions.');
//     }
//
//     // When we reach here, location permissions are granted and we can continue accessing the position.
//     Position position = await Geolocator.getCurrentPosition();
//     setState(() {
//       currentLocation = LatLng(position.latitude, position.longitude);
//       markers = [
//         Marker(
//           point: currentLocation!,
//           builder: (ctx) => Icon(Icons.location_pin, color: Colors.red, size: 40.0),
//         ),
//       ];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OpenStreetMap Demo'),
//       ),
//       body: currentLocation == null
//           ? Center(child: CircularProgressIndicator())
//           : FlutterMap(
//         mapController: mapController,
//         options: MapOptions(
//           center: currentLocation,
//           zoom: 13.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayerOptions(markers: markers),
//         ],
//       ),
//     );
//   }
// }


//dependencies
// dependencies:
// flutter:
// sdk: flutter
// cupertino_icons: ^1.0.2
// newness: ^1.1.2
// flutter_map: ^0.14.0
// latlong2: ^0.8.0
// positioned_tap_detector_2: ^1.0.4
// geolocator: ^7.6.0