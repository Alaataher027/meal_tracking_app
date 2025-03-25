import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';

class NoMealAddedYet extends StatelessWidget {
  const NoMealAddedYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/meal_black.svg"),
        SizedBox(
          height: 20,
        ),
        Text(
          "No meals added yet",
          style: Styles.textStyle14,
        )
      ],
    );
  }
}
