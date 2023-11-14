import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/widgets/new_expense.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.underTitle,
    required this.onAddExpense,
  });

  final String underTitle;
  final Function onAddExpense;

  Widget addAction(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(context: context, builder: (context) {
          return NewExpense(onAddExpense: onAddExpense);
        });
      },
      child: const Icon(
        Icons.add_circle,
        color: Colors.white70,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.purple,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      centerTitle: true,
      title: Column(
        children: [
          const Text(
            "Expenses",
            style: TextStyle(color: Colors.white70),
          ),
          Text(
            "Total: $underTitle",
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
      actions: [
        addAction(context),
      ],
    );
  }
}
