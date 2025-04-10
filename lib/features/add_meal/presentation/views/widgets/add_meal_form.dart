import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:alaa_taher/core/utils/styles.dart';
import 'package:alaa_taher/features/add_meal/presentation/manager/cubits/cubit/add_meal_cubit.dart';
import 'package:alaa_taher/features/add_meal/presentation/views/widgets/custom_button.dart';
import 'package:alaa_taher/features/add_meal/presentation/views/widgets/custom_text_field.dart';
import 'package:alaa_taher/features/home/data/models/meal_model.dart';
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
  TimeOfDay? selectedTime;

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
      pickTime();
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade400),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(selectedImage!, fit: BoxFit.cover),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo,
                                size: 50, color: Colors.grey),
                            SizedBox(height: 10),
                            Text("Upload Meal Image",
                                style: Styles.textStyle15),
                          ],
                        ),
                ),
              ),
              SizedBox(height: 25),
              CustomTextField(
                onSavedS: (value) => mealName = value,
                hint: "Meal Name",
                isNumerical: false,
              ),
              SizedBox(height: 15),
              CustomTextField(
                onSavedI: (value) => calories = value,
                hint: "Calories",
                isNumerical: true,
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: pickDate,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate != null && selectedTime != null
                            ? "${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}   At   ${selectedTime!.hour}:${selectedTime!.minute}"
                            : "Select a Date",
                        style: Styles.textStyle16.copyWith(
                          color:
                              selectedDate != null ? Colors.black : Colors.grey,
                        ),
                      ),
                      Icon(FontAwesomeIcons.calendar, color: Colors.black),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              BlocBuilder<AddMealCubit, AddMealState>(
                builder: (context, state) {
                  return CustomButton(
                    isLodaing: state is AddMealLoading,
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
                          dateTime: DateTime(
                            selectedDate!.year,
                            selectedDate!.month,
                            selectedDate!.day,
                            selectedTime!.hour,
                            selectedTime!.minute,
                          ),
                          imagePath: selectedImage!.path,
                        );

                        BlocProvider.of<AddMealCubit>(context).addMeal(meal);
                        // GoRouter.of(context).pop();
                      }
                    },
                    title: "Save Meal",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
