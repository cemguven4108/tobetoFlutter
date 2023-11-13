import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.actions,
    this.leading,
  });

  final String title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.purple,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      centerTitle: centerTitle,
      leading: leading,
      title: Text(title),
      actions: actions,
    );
  }
}
