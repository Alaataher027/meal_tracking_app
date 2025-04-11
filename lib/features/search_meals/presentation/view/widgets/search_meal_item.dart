import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/shimmering_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:alaa_taher/core/utils/app_router.dart';
import 'package:alaa_taher/core/utils/styles.dart';
import 'package:alaa_taher/features/search_meals/data/models/search_result_model.dart';
import 'package:alaa_taher/features/search_meals/presentation/manager/cubits/details_cubit/details_cubit.dart';

class SearchMealItem extends StatelessWidget {
  final SearchResultModel searchResultModel;

  const SearchMealItem({super.key, required this.searchResultModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<DetailsCubit>()
            .getDetails(mealName: searchResultModel.name);
        GoRouter.of(context).push(
          AppRouter.KSearchDetailsView,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                searchResultModel.imagePath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return ShimmeringImage();
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(Icons.image_not_supported,
                        size: 50, color: Colors.grey),
                  ); // placeholder
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                searchResultModel.name,
                style: Styles.textStyle15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
