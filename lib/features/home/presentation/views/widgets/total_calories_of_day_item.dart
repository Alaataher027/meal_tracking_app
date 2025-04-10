import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alaa_taher/constants.dart';
import 'package:alaa_taher/core/utils/styles.dart';
import 'package:alaa_taher/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';

class TotalCaloriesOfDayItem extends StatelessWidget {
  const TotalCaloriesOfDayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        int totalCalories = BlocProvider.of<MealCubit>(context).totalCalories;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(170, 239, 238, 243),
                  const Color.fromARGB(255, 212, 212, 212)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
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
                    children: [
                      Text(
                        "$totalCalories",
                        style: Styles.textStyle40.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        FontAwesomeIcons.fire,
                        size: 50,
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Total Calories of the day.",
                    style: Styles.textStyle14,
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
