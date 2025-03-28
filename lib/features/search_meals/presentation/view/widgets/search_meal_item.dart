import 'package:flutter/material.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';

class SearchMealItem extends StatelessWidget {
  const SearchMealItem({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "data",
              style: Styles.textStyle18,
            ),
          )
        ],
      ),
    );
  }
}
