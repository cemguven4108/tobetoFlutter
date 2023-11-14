import 'package:flutter/material.dart';
import 'package:introapp/models/project_model.dart';
import 'package:introapp/widgets/picture.dart';
import 'package:introapp/widgets/info.dart';
import 'package:introapp/widgets/info_project.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.name,
    required this.info,
    this.myProjects,
  });

  final String name;
  final String info;
  final List<ProjectModel>? myProjects;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Iterable<Widget>? listProjects() {
    return widget.myProjects?.map((project) {
      return InfoProject(project: project);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            backgroundColor: Colors.purple,
            floating: true,
            snap: true,
            title: Text("Homepage"),
            centerTitle: true,
          ),
        ],
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Picture(
                      pictureLocation: "assets/images/winXP.jpg"),
                ),
                const Info(
                  info: "Cem Guven",
                  color: Colors.deepOrange,
                ),
                const SizedBox(height: 10),
                const Info(
                  info: "Tobeto - Mobil Gelistirici - 1B",
                  color: Colors.deepOrange,
                ),
                const SizedBox(height: 10),
                const Info(info: "Projects", color: Colors.greenAccent),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...?listProjects(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
