import 'package:flutter/material.dart';
import 'package:meal_tracking_app/core/utils/assets.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';

class ImageAndNameDetails extends StatelessWidget {
  const ImageAndNameDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 130,
          width: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AssetsData.mealTest,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: Styles.textStyle18,
              ),
              Text(
                "Category",
                style: Styles.textStyle15,
              ),
              Text(
                "area",
                style: Styles.textStyle15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
