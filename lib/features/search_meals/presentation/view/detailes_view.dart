import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/details_shimmering_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alaa_taher/features/search_meals/presentation/manager/cubits/details_cubit/details_cubit.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoadingState) {
            return DetailsShimmeringLoading();
          } else if (state is DetailsSuccessState) {
            return DetailsViewBody(
                detailsModel:
                    BlocProvider.of<DetailsCubit>(context).detailsModel!);
          } else if (state is DetailsFalureState) {
            return Center(child: Text(state.errMessage));
          }
          return Expanded(
              child: const Center(child: Text("No data available")));
        },
      ),
    );
  }
}
