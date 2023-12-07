import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/models/enums/category.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';
import 'package:introapp/apps/expense_app/widgets/chart_bar_widget.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.expenses});

  final List<Expense> expenses;

  List<CategoryExpenses> get categoryExpenses {
    return [
      CategoryExpenses(
        category: Category.dress,
        expenses: expenses
            .where((element) => element.category == Category.dress)
            .toList(),
      ),
      CategoryExpenses(
        category: Category.food,
        expenses: expenses
            .where((element) => element.category == Category.food)
            .toList(),
      ),
      CategoryExpenses(
        category: Category.other,
        expenses: expenses
            .where((element) => element.category == Category.other)
            .toList(),
      ),
      CategoryExpenses(
        category: Category.travel,
        expenses: expenses
            .where((element) => element.category == Category.travel)
            .toList(),
      ),
      CategoryExpenses(
        category: Category.work,
        expenses: expenses
            .where((element) => element.category == Category.work)
            .toList(),
      ),
    ];
  }

  double get maxTotal {
    double maxTotal = 0;

    for (CategoryExpenses category in categoryExpenses) {
      if (category.totalCategoryPrice > maxTotal) {
        maxTotal = category.totalCategoryPrice;
      }
    }

    return maxTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: categoryExpenses
              .map(
                (element) => ChartBarWidget(
                  height: element.totalCategoryPrice == 0
                      ? 0
                      : element.totalCategoryPrice / maxTotal,
                ),
              )
              .toList(),
        )),
        const SizedBox(height: 3),
        Row(
            children: categoryExpenses
                .map((expense) =>
                    Expanded(child: Icon(categoryIcons[expense.category])))
                .toList())
      ]),
    );
  }
}
