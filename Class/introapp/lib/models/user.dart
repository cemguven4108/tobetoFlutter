import 'package:introapp/models/project_model.dart';
import 'package:uuid/uuid.dart';

class User {
  String id;
  final String name;
  final String info;
  final String username;
  final String password;
  final List<ProjectModel>? projects;

  User({
    required this.name,
    required this.info,
    required this.username,
    required this.password,
    this.projects,
  }) : id = const Uuid().v4();
}
