import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alaa_taher/constants.dart';
import 'package:alaa_taher/core/utils/assets.dart';
import 'package:alaa_taher/core/utils/styles.dart';
import 'package:alaa_taher/features/home/data/models/meal_model.dart';
import 'package:alaa_taher/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealModel});
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(mealModel.mealName ?? ''),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(
          FontAwesomeIcons.trashCan,
          color: Colors.white,
          size: 30,
        ),
      ),
      onDismissed: (direction) {
        mealModel.delete();
        BlocProvider.of<MealCubit>(context).featchAllMeals();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 0,
          color: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: mealModel.imagePath != null &&
                        mealModel.imagePath!.isNotEmpty
                    ? Image.file(
                        File(mealModel.imagePath!),
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/placeholder.png',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        AssetsData.mealTest,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealModel.mealName ?? "Not Found",
                      style: Styles.textStyle15,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.fire, size: 18),
                        Text(
                          " ${mealModel.calories.toString()} Cal",
                          style: Styles.textStyle16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.calendar, size: 18),
                        Text(
                          " ${mealModel.dateTime!.year}/${mealModel.dateTime!.month}/${mealModel.dateTime!.day}",
                          style: Styles.textStyle16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.solidClock, size: 18),
                        Text(
                          " ${mealModel.dateTime!.hour}:${mealModel.dateTime!.minute}",
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
      ),
    );
  }
}
