import 'package:flutter/material.dart';

void main() {
  runApp(MyLanguageApp());
}

class MyLanguageApp extends StatelessWidget {
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
  String _currentLanguage = 'English';
  String _displayText = 'Hello'; // Default text in English

  // Function to toggle between languages
  void _toggleLanguage() {
    setState(() {
      // Toggle between English and another language
      _currentLanguage = (_currentLanguage == 'English') ? 'Another Language' : 'English';

      // Update the displayed text based on the current language
      _displayText = (_currentLanguage == 'English') ? 'Hello' : 'Hola'; // Replace with your translations
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Learning App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _displayText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleLanguage,
              child: Text('Switch Language'),
            ),
          ],
        ),
      ),
    );
  }
}