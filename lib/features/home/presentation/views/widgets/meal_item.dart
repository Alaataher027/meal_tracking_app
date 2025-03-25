import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_tracking_app/constants.dart';
import 'package:meal_tracking_app/core/utils/assets.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/home/data/models/meal_model.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealModel});
  final MealModel mealModel;
//(name, calories, time, *photo)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Card(
        elevation: 0,
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: mealModel.imagePath != null &&
                      mealModel.imagePath!.isNotEmpty
                  ? Image.file(
                      File(mealModel
                          .imagePath!), // Load from file instead of asset
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/placeholder.png', // Fallback image
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      AssetsData.mealTest, // Default image when no path exists
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealModel.mealName ?? "not found",
                    style: Styles.textStyle15,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.fire,
                        size: 18,
                      ),
                      Text(
                        mealModel.calories.toString(),
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.solidClock,
                        size: 18,
                      ),
                      Text(
                        "${mealModel.dateTime!.year}/${mealModel.dateTime!.month}/${mealModel.dateTime!.day}",
                        style: Styles.textStyle16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
