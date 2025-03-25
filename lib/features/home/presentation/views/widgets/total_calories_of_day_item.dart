import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_tracking_app/constants.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';

class TotalCaloriesOfDayItem extends StatelessWidget {
  const TotalCaloriesOfDayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        int totalCalories = BlocProvider.of<MealCubit>(context).totalCalories;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Container(
            height: 170,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      DateTime today = DateTime.now();
                      BlocProvider.of<MealCubit>(context)
                          .filterMealsByDate(today);
                    },
                    icon: Icon(
                      FontAwesomeIcons.calendarDay,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$totalCalories",
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
