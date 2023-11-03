import 'package:introapp/models/question_model.dart';

const questions = [
  QuestionModel(
      "What is Flutter?",
      [
        "A programming language",
        "A mobile app development framework",
        "A database management system",
        "An operating system"
      ],
      "A mobile app development framework"),
  QuestionModel("Which programming language is used for Flutter development?",
      ["Java", "Swift", "Dart", "Python"], "Dart"),
  QuestionModel(
      "What is the purpose of the Flutter Engine?",
      [
        "To compile Dart code to machine code",
        "To provide a library of pre-built widgets",
        "To manage the state of the application",
        "To handle HTTP requests"
      ],
      "To compile Dart code to machine code"),
  QuestionModel(
      "What is a widget in Flutter?",
      [
        "A block of code that performs a specific task",
        "A type of data structure",
        "A method for handling user input",
        "A visual element in the user interface"
      ],
      "A visual element in the user interface"),
];