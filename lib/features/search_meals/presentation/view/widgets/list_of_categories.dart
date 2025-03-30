import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alaa_taher/features/search_meals/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/widgets/filter_item.dart';

class ListofCategories extends StatelessWidget {
  const ListofCategories({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Beef', 'icon': FontAwesomeIcons.cow},
    {'title': 'Breakfast', 'icon': FontAwesomeIcons.bacon},
    {'title': 'Chicken', 'icon': FontAwesomeIcons.drumstickBite},
    {'title': 'Dessert', 'icon': FontAwesomeIcons.iceCream},
    {'title': 'Goat', 'icon': FontAwesomeIcons.paw},
    {'title': 'Lamb', 'icon': FontAwesomeIcons.paw},
    {'title': 'Pasta', 'icon': FontAwesomeIcons.bowlFood},
    {'title': 'Pork', 'icon': FontAwesomeIcons.piggyBank},
    {'title': 'Seafood', 'icon': FontAwesomeIcons.fish},
    {'title': 'Side', 'icon': FontAwesomeIcons.utensils},
    {'title': 'Starter', 'icon': FontAwesomeIcons.pepperHot},
    {'title': 'Vegan', 'icon': FontAwesomeIcons.leaf},
    {'title': 'Vegetarian', 'icon': FontAwesomeIcons.carrot},
    {'title': 'Miscellaneous', 'icon': FontAwesomeIcons.rectangleList},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            BlocProvider.of<SearchCubit>(context)
                .getFilterResult(mealType: categories[index]['title']);
          },
          child: FilterItem(
            title: categories[index]['title'],
            icon: categories[index]['icon'],
          ),
        ),
      ),
    );
  }
}
