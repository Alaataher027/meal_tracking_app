import 'package:flutter/material.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/meal_item.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.zero, // top padding > 0
      itemBuilder: (context, index) {
        return MealItem();
      },
    );
  }
}
