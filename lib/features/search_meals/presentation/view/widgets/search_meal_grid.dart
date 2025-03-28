import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meal_tracking_app/core/utils/assets.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/search_meal_item.dart';

class SearchMealGrid extends StatelessWidget {
  const SearchMealGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      AssetsData.mealTest,
      AssetsData.mealTest,
      AssetsData.mealTest3,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
      AssetsData.mealTest3,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
      AssetsData.mealTest2,
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: MasonryGridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return SearchMealItem(imagePath: images[index]);
          },
        ),
      ),
    );
  }
}
