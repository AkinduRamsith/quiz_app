

import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/quiz.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadQuizQuestion(); 
  runApp(const Quiz());
}

