import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:alaa_taher/core/utils/app_router.dart';
import 'package:alaa_taher/features/home/presentation/manager/cubits/cubit/meal_cubit.dart';
import 'package:alaa_taher/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          GoRouter.of(context).push(AppRouter.KAddMealView);
        },
        child: Icon(
          FontAwesomeIcons.plus,
          size: 28,
          color: Colors.white,
        ),
      ),
      body: HomeViewBody(),
    );
  }
}
