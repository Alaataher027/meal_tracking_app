import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alaa_taher/core/utils/styles.dart';
import 'package:alaa_taher/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';
import 'package:alaa_taher/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:alaa_taher/features/home/presentation/views/widgets/meals_list_view.dart';
import 'package:alaa_taher/features/home/presentation/views/widgets/sort_menu.dart';
import 'package:alaa_taher/features/home/presentation/views/widgets/total_calories_of_day_item.dart';
import 'package:alaa_taher/features/home/presentation/views/widgets/yearly_dayes_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<MealCubit>(context).featchAllMeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          title: 'Calories Tracker',
          icon: (FontAwesomeIcons.magnifyingGlass),
        ),
        SizedBox(
          height: 10,
        ),
        YearlyDaysList(),
        TotalCaloriesOfDayItem(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                "Your Meals",
                style: Styles.textStyle18,
              ),
              Spacer(),
              SortMenu(),
            ],
          ),
        ),
        Expanded(
          child: MealsListView(),
        ),
      ],
    );
  }
}
