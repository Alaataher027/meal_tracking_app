import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/shimmering_image.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/shimmering_lines.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/shimmering_title.dart';
import 'package:flutter/widgets.dart';

class DetailsShimmeringLoading extends StatelessWidget {
  const DetailsShimmeringLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 15, right: 15),
              child: ImageAndNameShimmeringLoading(),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 25, left: 15, right: 15),
              child: ShimmeringTitle(
                width: 100,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 10, left: 15, right: 15),
              child: ShimmeringLines(),
            ),
            ShimmeringImage(),
            Padding(
              padding:  EdgeInsets.only(top: 25, left: 15, right: 15),
              child: ShimmeringTitle(
                width: 100,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 10, left: 15, right: 15),
              child: ShimmeringLines(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageAndNameShimmeringLoading extends StatelessWidget {
  const ImageAndNameShimmeringLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 130,
          width: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ShimmeringImage(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmeringTitle(
                  width: 100,
                ),
                ShimmeringTitle(
                  width: 100,
                ),
                ShimmeringTitle(
                  width: 100,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
