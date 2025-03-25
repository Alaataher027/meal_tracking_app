import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracking_app/features/home/data/models/meal_model.dart';
import 'package:meal_tracking_app/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/meal_item.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealSuccess) {
          List<MealModel> listOfMeals =
              BlocProvider.of<MealCubit>(context).mealsList ?? [];

          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<MealCubit>(context).featchAllMeals();
            },
            child: listOfMeals.isEmpty
                ? const Center(child: Text("No meals added yet"))
                : ListView.builder(
                    itemCount: listOfMeals.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return MealItem(mealModel: listOfMeals[index]);
                    },
                  ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
