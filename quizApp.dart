import 'package:flutter/material.dart';


class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the capital of France?',
      'answers': [
        {'text': 'Paris', 'correct': true},
        {'text': 'Berlin', 'correct': false},
        {'text': 'Madrid', 'correct': false},
        {'text': 'Rome', 'correct': false},
      ],
    },
    {
      'questionText': 'What is the largest mammal?',
      'answers': [
        {'text': 'Elephant', 'correct': false},
        {'text': 'Whale Shark', 'correct': false},
        {'text': 'Blue Whale', 'correct': true},
        {'text': 'Giraffe', 'correct': false},
      ],
    },
    // Add more questions as needed
  ];

  void _answerQuestion(bool isCorrect) {
    setState(() {
      _questionIndex++;
      if (isCorrect) {
        _score++;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              _questions[_questionIndex]['questionText'] as String,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          ...(_questions[_questionIndex]['answers'] as List<Map<String, Object>>).map(
                (answer) => Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () => _answerQuestion(answer['correct'] as bool),
                child: Text(answer['text'] as String),
              ),
            ),
          ),
        ],
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Your Score: $_score/${_questions.length}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resetQuiz,
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
