import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:meal_tracking_app/features/search_meals/data/models/details_model.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/manager/cubits/details_cubit/details_cubit.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/image_and_name_details.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/open_url.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/you_tube_video_screen.dart';

class DetailsViewBody extends StatelessWidget {
  final DetailsModel detailsModel;

  const DetailsViewBody({super.key, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Meal details"),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: ImageAndNameDetails(detailsModel: detailsModel),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Text("Recipe", style: Styles.textStyle18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(detailsModel.instructions,
                maxLines: 10, style: Styles.textStyle15),
          ),
          YouTubeVideoScreen(videoUrl: detailsModel.youTubeURL),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Text("Ingredients", style: Styles.textStyle18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
              "${detailsModel.ingredient1} : ${detailsModel.measure1}\n"
              "${detailsModel.ingredient2} : ${detailsModel.measure2}\n"
              "${detailsModel.ingredient3} : ${detailsModel.measure3}\n"
              "${detailsModel.ingredient4} : ${detailsModel.measure4}\n"
              "${detailsModel.ingredient5} : ${detailsModel.measure5}\n"
              "${detailsModel.ingredient6} : ${detailsModel.measure6}\n"
              "${detailsModel.ingredient7} : ${detailsModel.measure7}\n",
              maxLines: 10,
              style: Styles.textStyle15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text("Source:", style: Styles.textStyle18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: OpenUrl(url: detailsModel.sourceURL),
          )
        ],
      ),
    );
  }
}
