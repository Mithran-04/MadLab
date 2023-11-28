import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi-Threading Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = 'No Task Executed Yet';

  Future<void> _runHeavyTask() async {
    // Start the heavy task in a separate isolate
    final response = await compute(heavyTask, 10);
    // Update the UI with the result
    setState(() {
      _result = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Threading Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _runHeavyTask,
              child: Text('Run Heavy Task'),
            ),
            SizedBox(height: 20),
            Text(
              'Task Result: $_result',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}

// Simulate a heavy task like a CPU-intensive computation
String heavyTask(int value) {
  int result = 0;
  for (int i = 0; i < value * 1000000; i++) {
    result += i % 10;
  }
  return 'Task Completed with Result: $result';
}
