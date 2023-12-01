import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  List<String> selectAnswers=[];


  // @override
  // void initState() {
  //   activeScreen=StartScreen(onAction: onScreenChange,);

  //   super.initState();

  // }

  void onScreenChange(String value) {
    setState(() {
      activeScreen = value;
    });
  }
  void onRestart(String value) {
    setState(() {
      selectAnswers=[];
      activeScreen = value;
    });
  }

  void onAnswerSelect(String answer){
    selectAnswers.add(answer);
    if(selectAnswers.length==question.length){
      setState(() {
        activeScreen='result';
      });
      
    }
  }
  @override
  Widget build(BuildContext context) {
     Widget? currentScreen = StartScreen(onAction: onScreenChange);
    if(activeScreen=='start'){
      currentScreen=StartScreen(onAction: onScreenChange);
    }

    if(activeScreen=='quiz'){
      currentScreen= QuestionScreen(onAnswer:onAnswerSelect,onAction:onScreenChange,);
    }
    if(activeScreen=='result'){
      currentScreen= ResultScreen(onAction: onRestart,answerList:selectAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Colors.blue.shade400,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: currentScreen,
        ),
      ),
    );
  }
}
