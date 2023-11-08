import 'package:flutter/material.dart';
import 'package:introapp/data/projects.dart';
import 'package:introapp/models/project_model.dart';

//Need Improvement For now only works manually
//ToDo create object per project
//ToDo Design so that every 4 project the app creates another Row under the previous Row that's been filled
class ProjectInfoWidget extends StatelessWidget {
  const ProjectInfoWidget({super.key});

  final List<ProjectModel> list = projects;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => list[0].screenWidget));
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(list[0].imagePath)),
            ),
            child: Text(list[0].name,
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
