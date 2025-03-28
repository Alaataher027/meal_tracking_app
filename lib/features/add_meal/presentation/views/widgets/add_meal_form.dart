import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/manager/cubits/cubit/add_meal_cubit.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/custom_button.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/custom_text_field.dart';
import 'package:meal_tracking_app/features/home/data/models/meal_model.dart';
import 'package:meal_tracking_app/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SvgPicture.asset(
                          "assets/images/upload_photo.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 220,
                      child: CustomTextField(
                        onSavedS: (value) {
                          mealName = value;
                        },
                        hint: "Meal name",
                        isNumerical: false,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 220,
                      child: CustomTextField(
                        onSavedI: (value) {
                          calories = value;
                        },
                        hint: "Calories",
                        isNumerical: true,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: pickDate,
                      icon: Icon(
                        FontAwesomeIcons.calendarPlus,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      selectedDate != null
                          ? "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"
                          : "",
                      style: Styles.textStyle16,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<AddMealCubit, AddMealState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Spacer(),
                    CustomButton(
                      isLodaing: state is AddMealLoading ? true : false,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (selectedDate == null || selectedImage == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please select both date and image"),
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
                          // GoRouter.of(context).pop();
                        }
                      },
                      title: "Save",
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
