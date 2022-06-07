import 'package:flutter/material.dart';
import 'package:quiz_app_quizzler/model/question_brain.dart';
import 'package:quiz_app_quizzler/reusables/dialog_diaplay.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Widget> scoreKeeper = [];

  QuestionBrain questionBrain = QuestionBrain();

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = questionBrain.getAnswer()!;
    setState(() {
      if(questionBrain.isFinished() == true){
        DialogDisplay.showErrorDialog(context, "Quiz Finished, press ok to restart!");
        questionBrain.reset();
        scoreKeeper.clear();
      }else{
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionBrain.nextQuestion();
      }
    });
  }


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
              question: questionBrain.getQuestionText()!,
            ),
            buttonWidget(
                buttonColor: Colors.green,
                buttonText: "True",
                callback: () {
                  checkAnswer(true);
                }),
            buttonWidget(
                buttonColor: Colors.red,
                buttonText: "False",
                callback: () {
                  checkAnswer(false);
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
