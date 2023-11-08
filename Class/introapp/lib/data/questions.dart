import 'package:introapp/models/question_model.dart';

const questions = [
  QuestionModel(
    "What is Flutter?",
    {
      "A programming language": false,
      "A mobile app development framework": true,
      "A database management system": false,
      "An operating system": false,
    },
  ),
  QuestionModel(
    "Which programming language is used for Flutter development ?",
    {
      "Java": false,
      "Swift": false,
      "Dart": true,
      "Python": false,
    },
  ),
  QuestionModel(
    "What is the purpose of the Flutter Engine?",
    {
      "To compile Dart code to machine code": true,
      "To provide a library of pre-built widgets": false,
      "To manage the state of the application": false,
      "To handle HTTP requests": false,
    },
  ),
  QuestionModel(
    "What is a widget in Flutter?",
    {
      "A block of code that performs a specific task": false,
      "A type of data structure": false,
      "A method for handling user input": false,
      "A visual element in the user interface": true,
    },
  ),
  QuestionModel(
    "Which function is run first on startup ?",
    {
      "runApp()": false,
      "run()": false,
      "Scaffold()": false,
      "main()": true,
    },
  ),
  QuestionModel(
    "Which company developed Flutter ?",
    {
      "Oracle": false,
      "Facebook": false,
      "Google": true,
      "IBM": false,
    },
  ),
  QuestionModel(
    "Is dart required for flutter developing ?",
    {
      "Yes": true,
      "No": false,
    },
  ),
  QuestionModel(
    "Which platforms can you develope apps using Flutter ?",
    {
      "iOS": false,
      "Android": false,
      "iOS and Android": true,
      "None of the above": false,
    },
  ),
  QuestionModel(
    "Which of the choices below is a Widget ?",
    {
      "Stateful": true,
      "Constructor": false,
      "Class": false,
      "Const": false, 
    },
  ),
  QuestionModel(
    "Which function you have to implement when a class extends a StatelessWidget class",
    {
      "create()": false,
      "build()": true,
      "run()": false,
      "setState()": false,
    },
  ),
];
