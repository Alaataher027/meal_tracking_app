import 'package:flutter/material.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/meals_list_view.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/total_calories_of_day_item.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/yearly_dayes_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        SizedBox(
          height: 10,
        ),
        YearlyDaysList(),
        TotalCaloriesOfDayItem(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Your Meals",
            style: Styles.textStyle18,
          ),
        ),
        Expanded(
          child: MealsListView(),
        ),
      ],
    );
  }
}
