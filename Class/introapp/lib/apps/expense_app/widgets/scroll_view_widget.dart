import 'package:flutter/material.dart';

class ScrollViewWidget extends StatelessWidget {
  const ScrollViewWidget({super.key, required this.body, required this.headerSliverBuilder});

  final Widget body;
  final List<Widget> headerSliverBuilder;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return headerSliverBuilder;
        },
        body: body);
  }
}
