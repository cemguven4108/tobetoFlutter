import 'package:introapp/apps/expense_app/screens/home_screen.dart';
import 'package:introapp/apps/music_player_app/screens/audio_player_screen.dart';
import 'package:introapp/models/project_model.dart';
import 'package:introapp/apps/quiz_app/screens/quiz_home_screen.dart';

List<ProjectModel> projects = [
  const ProjectModel("Quiz App", QuizHomeScreen(), "assets/images/quiz_image.jpg"),
  const ProjectModel("Expense App", ExpenseHomeScreen(), "assets/images/expense_image.png"),
  const ProjectModel("Music Player App", AudioPlayerScreen(), "assets/images/music_player.jpg"),
];
