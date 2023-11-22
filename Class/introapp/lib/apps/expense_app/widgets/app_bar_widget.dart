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
        showBottomSheet(
          context: context,
          builder: (context) {
            return NewExpense(onAddExpense: onAddExpense);
          },
        );
      },
      child: Icon(
        Icons.add_circle,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepPurple.shade900,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Expenses",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            underTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: addAction(context),
        ),
      ],
    );
  }
}
