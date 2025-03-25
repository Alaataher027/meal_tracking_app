import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/manager/cubits/cubit/add_meal_cubit.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/add_meal_form.dart';
import 'package:meal_tracking_app/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/custom_app_bar.dart';

class AddMealViewBody extends StatelessWidget {
  const AddMealViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(
          title: "Add your meal",
        ),
        BlocProvider(
          create: (context) => AddMealCubit(),
          child: BlocConsumer<AddMealCubit, AddMealState>(
            listener: (context, state) {
              if (state is AddMealFailure) {
                print("failed");
              }
              if (state is AddMealSuccess) {
                BlocProvider.of<MealCubit>(context).featchAllMeals();
                GoRouter.of(context).pop(); //
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return AddMealForm();
            },
          ),
        ),
      ],
    );
  }
}
