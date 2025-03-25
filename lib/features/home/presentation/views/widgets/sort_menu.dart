import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_tracking_app/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';

class SortMenu extends StatelessWidget {
  const SortMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // Call sortMeals function when a sorting option is selected
        BlocProvider.of<MealCubit>(context).sortMeals(value);
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: "name",
          child: Text("Sort by Name"),
        ),
        const PopupMenuItem(
          value: "calories",
          child: Text("Sort by Calories"),
        ),
      ],
      icon: const Icon(
        FontAwesomeIcons.sort,
        color: Colors.black,
      ),
    );
  }
}