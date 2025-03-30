import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alaa_taher/features/search_meals/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: SearchViewBody(),
      ),
    );
  }
}
