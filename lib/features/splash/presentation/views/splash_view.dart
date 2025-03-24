import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_tracking_app/core/utils/app_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      navigateToHomeView(context);
    });

    return Scaffold(
      body: splashTitle(),
    );
  }
}

class splashTitle extends StatelessWidget {
  const splashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Your Calories Tracker"),
    );
  }
}

void navigateToHomeView(BuildContext context) {
  GoRouter.of(context).push(AppRouter.KHomeView);
}
