import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracking_app/features/add_meal/presentation/views/widgets/custom_text_field.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/filter_item.dart';
import 'package:meal_tracking_app/features/search_meals/presentation/view/widgets/search_meal_grid.dart';

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
        const ListofCatigories(),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccessState) {
              return SearchMealGrid(searchResultList: state.searchResultList);
            } else if (state is SearchLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SearchFalureState) {
              return Center(child: Text(state.errMessage));
            } else {
              return Container(
                child: Text("search"),
              );
            }
          },
        ),
      ],
    );
  }
}
