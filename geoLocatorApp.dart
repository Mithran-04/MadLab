import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors/sensors.dart';
import 'package:rxdart/rxdart.dart';



class GeoLocator extends StatefulWidget {
  @override
  _GeoLocatorState createState() => _GeoLocatorState();
}

class _GeoLocatorState extends State<GeoLocator> {
  String locationData = 'Location: Not available';
  String accelerometerData = 'Accelerometer: Not available';

  @override
  void initState() {
    super.initState();
    _getLocation();
    _initAccelerometer();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        locationData =
        'Location: ${position.latitude}, ${position.longitude}';
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _initAccelerometer() {

    accelerometerEvents.throttleTime(Duration(seconds: 1)).listen(
          (AccelerometerEvent event) {
        setState(() {
          accelerometerData = 'Accelerometer: ${event.x}, ${event.y}, ${event.z}';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geo-Accel App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              locationData,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              accelerometerData,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
