import 'package:flutter/material.dart';

enum Category {
  work,
  travel,
  food,
  dress,
  other,
}

const categoryIcons = {
  Category.work: Icons.work,
  Category.travel: Icons.place_outlined,
  Category.dress: Icons.shopify,
  Category.food: Icons.food_bank,
  Category.other: Icons.add_chart_rounded,
};
