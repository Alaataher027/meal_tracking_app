import 'package:flutter/material.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/image_and_name_details.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/open_url.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/you_tube_video_screen.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Meal details"),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: ImageAndNameDetails(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Text(
              "Recipe",
              style: Styles.textStyle18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              "Put the flour, eggs, milk, 1 tbsp oil and a pinch of salt into a bowl or large jug, then whisk to a smooth batter. Set aside for 30 mins to rest if you have time, or start cooking straight away.\r\nSet a medium frying pan or crêpe pan over a medium heat and carefully wipe it with some oiled kitchen paper. When hot, cook your pancakes for 1 min on each side until golden, keeping them warm in a low oven as you go.\r\nServe with lemon wedges and sugar, or your favourite filling. Once cold, you can layer the pancakes between baking parchment, then wrap in cling film and freeze for up to 2 months.",
              maxLines: 10,
              style: Styles.textStyle15,
            ),
          ),
          YouTubeVideoScreen(
            videoUrl: 'https://www.youtube.com/watch?v=GsB8ZI5vREA',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Text(
              "Ingredians",
              style: Styles.textStyle18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              "strIngredient1 : strMeasure1\nstrIngredient1 : strMeasure1\nstrIngredient1 : strMeasure1\nstrIngredient1 : strMeasure1\nstrIngredient1 : strMeasure1\n",
              maxLines: 10,
              style: Styles.textStyle15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Text(
              "Source:",
              style: Styles.textStyle18,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: OpenUrl(
                  url:
                      "https://www.bbcgoodfood.com/recipes/9529/winter-tuna-nioise"))
        ],
      ),
    );
  }
}
