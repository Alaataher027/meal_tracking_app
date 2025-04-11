import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/shimmering_image.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/shimmering_title.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchMealShimmerItem extends StatelessWidget {
  const SearchMealShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmeringImage(),
          const SizedBox(height: 8),
          ShimmeringTitle(
            width: 100,
          ),
        ],
      ),
    );
  }
}
