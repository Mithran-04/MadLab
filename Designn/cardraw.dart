import 'package:flutter/material.dart';

void main() {
  runApp(CarApp());
}

class CarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Car with Shapes'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: CarWidget(),
      ),
    );
  }
}

class CarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Car Body
          Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          // Car Top
          Positioned(
            top: 30,
            child: Container(
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          ),
          // Wheels
          // Car Roof
          Positioned(
            top: 20, // Adjust this value as needed to position the roof accordingly
            child: Container(
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            left: 5,
            bottom: -10,
            child: CircleAvatar(
              backgroundColor: Colors.black87,
              radius: 15,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 5,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: -10,
            child: CircleAvatar(
              backgroundColor: Colors.black87,
              radius: 15,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
