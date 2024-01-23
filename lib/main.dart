import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs',
  //   'Approximately one quarter of human bones are in the feet',
  //   'A slug\'s blood is green',
  // ];

  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];

  // Question q1 = Question(
  //     questionText: 'You can lead a cow down stairs but not up stairs',
  //     questionAnswer: false);

  List<Question> questionBank = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs',
        questionAnswer: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green', questionAnswer: true),
  ];

  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  print('user got it right');
                } else {
                  print('User got it wrong');
                }
                setState(
                  () {
                    scoreKeeper.add(
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                    questionNumber = questionNumber + 1;
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == false) {
                  print('user got it right');
                } else {
                  print('User got it wrong');
                }
                setState(
                  () {
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                    questionNumber = questionNumber + 1;
                  },
                );
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
