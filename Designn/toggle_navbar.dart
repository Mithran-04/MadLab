import 'package:flutter/material.dart';

void main() {
  runApp(MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedSection = 'Workouts';

  // Function to handle menu item selection
  void _onItemSelected(String section) {
    setState(() {
      _selectedSection = section;
    });

    // Close the drawer after selecting an item (optional)
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedSection),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Fitness App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Workouts'),
              selected: _selectedSection == 'Workouts',
              onTap: () => _onItemSelected('Workouts'),
            ),
            ListTile(
              title: Text('Progress'),
              selected: _selectedSection == 'Progress',
              onTap: () => _onItemSelected('Progress'),
            ),
            ListTile(
              title: Text('Settings'),
              selected: _selectedSection == 'Settings',
              onTap: () => _onItemSelected('Settings'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Content of $_selectedSection section'),
      ),
    );
  }
}