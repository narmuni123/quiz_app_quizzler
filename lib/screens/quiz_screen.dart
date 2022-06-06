import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            questionTile(question: "This is where the question text will go."),
            buttonWidget(buttonColor: Colors.green, buttonText: "True", callback: (){
              setState(() {
                scoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
              });
            }),
            buttonWidget(buttonColor: Colors.red, buttonText: "False", callback: (){
              setState(() {
                scoreKeeper.add(const Icon(Icons.close, color: Colors.red,));
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

  Widget questionTile({required String question}){
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

  Widget buttonWidget({required Color buttonColor, required String buttonText, required VoidCallback callback}){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              buttonColor,
            ),),
          child:  Text(
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
