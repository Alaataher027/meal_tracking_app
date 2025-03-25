import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/manager/cubits/cubit/add_meal_cubit.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/custom_button.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/custom_text_field.dart';
import 'package:meal_tracking_app/features/home/data/models/meal_model.dart';
import 'package:permission_handler/permission_handler.dart';

class AddMealForm extends StatefulWidget {
  const AddMealForm({super.key});

  @override
  State<AddMealForm> createState() => _AddMealFormState();
}

class _AddMealFormState extends State<AddMealForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? mealName;
  int? calories;
  DateTime? selectedDate;
  File? selectedImage;

  Future pickImage() async {
    if (await Permission.photos.request().isGranted ||
        await Permission.storage.request().isGranted) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permission denied")),
      );
    }
  }

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: selectedImage != null
                    ? FileImage(selectedImage!)
                    : const AssetImage("assets/images/upload_image.png")
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSavedS: (value) {
              mealName = value;
            },
            hint: "Meal name",
            isNumerical: false,
          ),
          SizedBox(
            height: 12,
          ),
          CustomTextField(
            onSavedI: (value) {
              calories = value;
            },
            hint: "Calories",
            isNumerical: true,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                CustomButton(
                  onTap: pickDate,
                  title: "Pick Time",
                ),
                Spacer(),
                CustomButton(
                  onTap: pickImage,
                  title: "Select Image",
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            selectedDate != null
                ? "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"
                : "Select a date",
            style: Styles.textStyle16,
          ),
          BlocBuilder<AddMealCubit, AddMealState>(
            builder: (context, state) {
              return CustomButton(
                isLodaing: state is AddMealLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (selectedDate == null || selectedImage == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select both date and image"),
                        ),
                      );
                      return;
                    }
                    MealModel meal = MealModel(
                      mealName: mealName,
                      calories: calories,
                      dateTime: selectedDate,
                      imagePath: selectedImage!.path,
                    );

                    BlocProvider.of<AddMealCubit>(context).addMeal(meal);
                    print(meal.mealName);
                    print(meal.calories);
                    print(meal.dateTime);
                    print(meal.imagePath);
                  }
                },
                title: "Save",
              );
            },
          )
        ],
      ),
    );
  }
}
