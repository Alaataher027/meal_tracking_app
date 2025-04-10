import 'package:alaa_taher/features/add_meal/presentation/manager/cubits/cubit/add_meal_cubit.dart';
import 'package:alaa_taher/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:alaa_taher/constants.dart';
import 'package:alaa_taher/core/utils/app_router.dart';
import 'package:alaa_taher/features/home/data/models/meal_model.dart';
import 'package:alaa_taher/features/search_meals/presentation/manager/cubits/details_cubit/details_cubit.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MealModelAdapter());
  await Hive.openBox<MealModel>(kMealsBox);
  runApp(const MealTrackingApp());
}

class MealTrackingApp extends StatelessWidget {
  const MealTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailsCubit(),
        ),
        BlocProvider(
          create: (context) => AddMealCubit(),
        ),
        BlocProvider(
          create: (context) => MealCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
      ),
    );
  }
}
