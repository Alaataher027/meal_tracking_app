import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_tracking_app/constants.dart';
import 'package:meal_tracking_app/core/utils/assets.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key});
//(name, calories, time, *photo)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
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
              child: Image.asset(
                AssetsData.mealTest,
                width: 130,
                height: 130,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Tuna Salad",
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
                        " Calories",
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
                        " Time",
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
