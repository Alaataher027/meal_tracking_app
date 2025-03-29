import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_tracking_app/core/utils/app_router.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/search_meals/data/models/search_result_model.dart';

class SearchMealItem extends StatelessWidget {
  final SearchResultModel searchResultModel;

  const SearchMealItem({super.key, required this.searchResultModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.KSearchDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                searchResultModel.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                searchResultModel.name,
                style: Styles.textStyle15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
