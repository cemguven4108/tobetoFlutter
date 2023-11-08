import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:introapp/models/question_model.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key, required this.questions, required this.allResults, required this.score});

  final List<QuestionModel> allResults;
  final List<QuestionModel> questions;
  final int score;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isFabVisible = false;
  ScrollController controller = ScrollController();

  bool changeUpButtonVisibility(UserScrollNotification notification) {
    if (notification.direction == ScrollDirection.forward) {
      setState(() => isFabVisible = false);
    } else if (notification.direction == ScrollDirection.reverse) {
      setState(() => isFabVisible = true);
    }
    return true;
  }

  void scrollUp() {
    controller.animateTo(
      controller.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  Iterable<Card> listAll() {
    return widget.allResults.map((result) {
      return Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                result.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            ...result.answers.map((key, value) {
              return MapEntry(
                  ListTile(
                    tileColor: !value ? Colors.red : Colors.green,
                    title: Text("Answer: $key\nCorrect: ${correctAnswer(result.question)}"),
                  ),
                  value);
            }).keys,
          ],
        ),
      );
    });
  }

  String correctAnswer(String question) {
    String correctAnswer = "";
    for (int i = 0; i < 10; i++) {
      if (widget.questions[i].question == question) {
        widget.questions[i].answers.forEach((key, value) {
          if (value) correctAnswer = key;
        });
      }
    }
    return correctAnswer;
  }

  @override
  Widget build(BuildContext context) {
    String score = widget.score.toString();

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: NestedScrollView(
        controller: controller,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.purple,
            floating: true,
            snap: true,
            title: Text("Score: $score"),
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
                children: <Widget>[
                  ...listAll(),
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
