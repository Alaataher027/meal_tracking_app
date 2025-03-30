import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alaa_taher/features/add_meal/presentation/manager/cubits/cubit/add_meal_cubit.dart';
import 'package:alaa_taher/features/add_meal/presentation/views/widgets/add_meal_view_body.dart';
import 'package:alaa_taher/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';

class AddMealView extends StatelessWidget {
  const AddMealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => MealCubit()..featchAllMeals()),
        BlocProvider(create: (context) => AddMealCubit()),
      ], child: AddMealViewBody()),
    );
  }
}
