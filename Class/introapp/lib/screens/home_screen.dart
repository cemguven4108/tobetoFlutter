import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:introapp/models/project_model.dart';
import 'package:introapp/widgets/info_picture_widget.dart';
import 'package:introapp/widgets/info_widget.dart';
import 'package:introapp/widgets/project_info_widget.dart';

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
  bool isFabVisible = false;
  ScrollController controller = ScrollController();

  void goTo(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  bool changeUpButtonVisibility(UserScrollNotification notification) {
    if (notification.direction == ScrollDirection.forward) {
      setState(() => isFabVisible = false);
    } else if (notification.direction == ScrollDirection.reverse) {
      setState(() => isFabVisible = true);
    }
    return true;
  }

  Iterable<Widget>? listProjects() {
    return widget.myProjects?.map((project) {
      return ProjectInfoWidget(project: project);
    });
  }

  void scrollUp() {
    controller.animateTo(
      controller.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: NestedScrollView(
        controller: controller,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            backgroundColor: Colors.purple,
            floating: true,
            snap: true,
            title: Text("My Homepage"),
            centerTitle: true,
          ),
        ],
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            return changeUpButtonVisibility(notification);
          },
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const InfoPictureWidget(
                        pictureLocation: "assets/images/winXP.jpg"),
                  ),
                  const InfoWidget(
                    info: "Cem Guven",
                    color: Colors.deepOrange,
                  ),
                  const SizedBox(height: 10),
                  const InfoWidget(
                    info: "Tobeto - Mobil Gelistirici - 1B",
                    color: Colors.deepOrange,
                  ),
                  const SizedBox(height: 25),
                  const InfoWidget(info: "Projects", color: Colors.greenAccent),
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
      ),
      floatingActionButton: isFabVisible
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                scrollUp();
              },
            )
          : null,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
