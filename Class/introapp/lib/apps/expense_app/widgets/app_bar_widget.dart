import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.actions,
    this.leading,
    this.underTitle,
  });

  final String? underTitle;
  final List<Widget>? actions;
  final Widget? leading;

  Widget placeUnderTitle() {
    if (underTitle != null) {
      return Text(
        "Total: $underTitle",
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      );
    } else {
      return const Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.purple,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      centerTitle: true,
      leading: leading,
      title: Column(
        children: [
          const Text("Expenses"),
          placeUnderTitle(),
        ],
      ),
      actions: actions,
    );
  }
}
