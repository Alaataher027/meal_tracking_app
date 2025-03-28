import 'package:flutter/material.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';
import 'package:meal_tracking_app/features/search_meals/data/models/details_model.dart';

class ImageAndNameDetails extends StatelessWidget {
  const ImageAndNameDetails({super.key, required this.detailsModel});
    final DetailsModel detailsModel;


  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        SizedBox(
          height: 130,
          width: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              detailsModel.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detailsModel.name,
                style: Styles.textStyle18,
              ),
              Text(
                detailsModel.category,
                style: Styles.textStyle15,
              ),
              Text(
                detailsModel.area,
                style: Styles.textStyle15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
