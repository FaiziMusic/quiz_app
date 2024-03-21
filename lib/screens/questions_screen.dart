import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions_dummy.dart';
import 'package:quiz_app/widget/button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswers});
  final void Function(String answers) onSelectedAnswers;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionindex = 0;
  void answerQuestion(String answers) {
    widget.onSelectedAnswers(answers);
    setState(() {
      currentQuestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final currentQuestion = questions[currentQuestionindex];

    return Scaffold(
        body: Container(
      width: width,
      padding: EdgeInsets.all(width * 0.07),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          ...currentQuestion.getShuffledAnswer().map((answers) {
            return CustomElevatedButton(
                onPressed: () {
                  answerQuestion(answers);
                },
                text: answers);
          })
        ],
      ),
    ));
  }
}
