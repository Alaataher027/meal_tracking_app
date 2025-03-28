import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_tracking_app/constants.dart';
import 'package:meal_tracking_app/core/utils/app_router.dart';
import 'package:meal_tracking_app/features/home/data/models/meal_model.dart';

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
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
