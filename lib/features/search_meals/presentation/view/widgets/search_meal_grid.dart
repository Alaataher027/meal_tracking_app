import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meal_tracking_app/core/utils/assets.dart';
import 'package:meal_tracking_app/features/search_meals/data/models/search_result_model.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/search_meal_item.dart';

class SearchMealGrid extends StatelessWidget {
  const SearchMealGrid({super.key, required this.searchResultList});
  final List<SearchResultModel> searchResultList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: MasonryGridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: searchResultList.length,
          itemBuilder: (context, index) {
            return SearchMealItem(searchResultModel: searchResultList[index]);
          },
        ),
      ),
    );
  }
}
