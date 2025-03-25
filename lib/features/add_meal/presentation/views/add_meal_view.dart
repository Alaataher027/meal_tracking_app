import 'package:flutter/material.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/add_meal_view_body.dart';

class AddMealView extends StatelessWidget {
  const AddMealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AddMealViewBody(),
    );
  }
}
