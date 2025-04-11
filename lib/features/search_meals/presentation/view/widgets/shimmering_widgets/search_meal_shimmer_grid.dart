import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/search_meal_shimmer_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchMealShimmerGrid extends StatelessWidget {
  const SearchMealShimmerGrid({super.key});

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
          itemCount: 6, // You can show 6 shimmer items while loading
          itemBuilder: (context, index) {
            return const SearchMealShimmerItem();
          },
        ),
      ),
    );
  }
}
