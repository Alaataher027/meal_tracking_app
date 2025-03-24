import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_tracking_app/constants.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';

class TotalCaloriesOfDayItem extends StatelessWidget {
  const TotalCaloriesOfDayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Container(
        height: 200,
        // width: 70,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "5402",
                    style: Styles.textStyle50,
                  ),
                  Text(
                    "Total calories of the day",
                    style: Styles.textStyle14,
                  )
                ],
              ),
              Spacer(),
              Icon(
                FontAwesomeIcons.fire,
                size: 65,
              )
            ],
          ),
        ),
      ),
    );
  }
}
