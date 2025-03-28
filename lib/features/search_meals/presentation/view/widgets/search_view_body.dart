import 'package:flutter/material.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/custom_text_field.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/filter_item.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/search_meal_grid.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomTextField(
          hint: "Search for meals..",
          isNumerical: false,
          icon: Icon(Icons.search),
        ),
        ListofCatigories(),
        SearchMealGrid()
      ],
    );
  }
}
