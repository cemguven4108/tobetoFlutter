import 'package:flutter/material.dart';
import 'package:introapp/models/project_model.dart';

//Need Improvement, for now only works manually
//ToDo - Create Widget per Project
//ToDo - Design so that every 4 project the app creates another Row under the previous Row that's been filled
class ProjectInfoWidget extends StatelessWidget {
  const ProjectInfoWidget({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => project.screenWidget));
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(project.imagePath)),
            ),
            child: Text(project.name,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
