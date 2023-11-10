import 'package:flutter/material.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar(
      {super.key, required this.logout, required this.add, required this.user});

  final Widget logout;
  final Widget add;
  final Widget user;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.purple,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      centerTitle: true,
      leading: logout,
      title: const Text("Expenses"),
      actions: [
        add,
        const SizedBox(width: 10),
        user,
      ],
    );
  }
}
