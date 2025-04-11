import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/shimmering_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeringLines extends StatelessWidget {
  const ShimmeringLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmeringTitle(width: 300),
        ShimmeringTitle(width: 100),
        ShimmeringTitle(width: 400),
        ShimmeringTitle(width: 250),
        ShimmeringTitle(width: 200),
        ShimmeringTitle(width: 250),
        ShimmeringTitle(width: 250),
      ],
    );
  }
}
