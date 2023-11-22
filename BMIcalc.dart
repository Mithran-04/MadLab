import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double height = 170.0;
  double weight = 70.0;
  double bmi = 0.0;

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your height (cm):',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Slider(
              value: height,
              min: 120,
              max: 220,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
            Text(
              '$height cm',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Enter your weight (kg):',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Slider(
              value: weight,
              min: 30,
              max: 200,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            Text(
              '$weight kg',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
                // Display the result using a dialog or navigate to a new screen
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('BMI Result'),
                      content: Text('Your BMI is ${bmi.toStringAsFixed(2)}'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
