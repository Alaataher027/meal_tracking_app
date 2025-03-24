import 'package:flutter/material.dart';
import 'package:meal_tracking_app/core/utils/app_router.dart';

void main() {
  runApp(const MealTrackingApp());
}

class MealTrackingApp extends StatelessWidget {
  const MealTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,

    );
  }
}

