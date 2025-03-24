import 'package:flutter/material.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/custom_button.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/custom_text_field.dart';
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
        // Image.asset(
        //   "assets/images/upload_image.png",
        //   height: 200,
        //   width: 200,
        //   fit: BoxFit.fill,
        // ),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
          hint: "Meal name",
          isNumerical: false,
        ),
        SizedBox(
          height: 12,
        ),
        CustomTextField(
          hint: "Calories",
          isNumerical: true,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            children: [
              CustomButton(
                title: "Pick Time",
              ),
              Spacer(),
              CustomButton(
                title: "Select Image",
              )
            ],
          ),
        )
      ],
    );
  }
}
