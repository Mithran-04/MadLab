import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _output = '';
  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '';
        _output = '';
      } else if (buttonText == '=') {
        try {
          _output = _evaluate(_input);
        } catch (e) {
          _output = 'Error';
        }
      } else {
        _input += buttonText;
      }
    });}





  String _evaluate(String input) {
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input',
                contentPadding: EdgeInsets.all(10),
              ),
              controller: TextEditingController(text: _input),
            ),
            SizedBox(height: 20),
            Text(
              _output,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: _buttons.length,
              itemBuilder: (context, index) {
                return _buildCalcButton(_buttons[index]);
              },
            ),],),),);
  }

  Widget _buildCalcButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => _onButtonPressed(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20),
      ),
    );}

  List<String> _buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    '0', 'C', '=', '+',
  ];
}

