import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Widget> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];

  List<bool> answers = [
    false,
    true,
    true
  ];

  int questionTracker = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            questionTile(
              question: questions[questionTracker],
            ),
            buttonWidget(
                buttonColor: Colors.green,
                buttonText: "True",
                callback: () {
                  bool correctAnswer = answers[questionTracker];
                  if(correctAnswer == true){
                    print("User got it right");
                  }else{
                    print("User got it wrong");
                  }
                  setState(() {
                    questionTracker++;
                    scoreKeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                }),
            buttonWidget(
                buttonColor: Colors.red,
                buttonText: "False",
                callback: () {
                  bool correctAnswer = answers[questionTracker];
                  if(correctAnswer == false){
                    print("User got it right");
                  }else{
                    print("User got it wrong");
                  }
                  setState(() {
                    questionTracker++;
                    scoreKeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }),
            Row(
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }

  Widget questionTile({required String question}) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonWidget(
      {required Color buttonColor,
      required String buttonText,
      required VoidCallback callback}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              buttonColor,
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: callback,
        ),
      ),
    );
  }
}
