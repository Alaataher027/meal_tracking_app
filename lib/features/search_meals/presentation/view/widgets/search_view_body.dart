import 'package:alaa_taher/features/search_meals/presentation/view/widgets/shimmering_widgets/search_meal_shimmer_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alaa_taher/features/add_meal/presentation/views/widgets/custom_text_field.dart';
import 'package:alaa_taher/features/search_meals/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/widgets/list_of_categories.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/widgets/search_meal_grid.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomTextField(
          hint: "Search for meals..",
          isNumerical: false,
          icon: Icon(Icons.search),
          onChanged: (searchWord) {
            if (searchWord!.isNotEmpty) {
              BlocProvider.of<SearchCubit>(context)
                  .getSearchResult(searchWord: searchWord);
            }
          },
        ),
        const ListofCategories(),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccessState) {
              return SearchMealGrid(searchResultList: state.searchResultList);
            } else if (state is SearchLoadingState) {
              return const SearchMealShimmerGrid();
            } else if (state is SearchFalureState) {
              return Expanded(child: Center(child: Text(state.errMessage)));
            } else {
              return Expanded(
                child: Center(
                  child: BeforeSearchWidget(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class BeforeSearchWidget extends StatelessWidget {
  const BeforeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/before_search.svg",
          height: 250,
          width: 250,
        ),
        Text("Start Exploring New Dishes!")
      ],
    );
  }
}
