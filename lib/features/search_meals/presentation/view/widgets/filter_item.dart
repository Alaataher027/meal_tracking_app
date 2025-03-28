import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_tracking_app/constants.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
        color: kPrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          SizedBox(
            width: 8,
          ),
          Icon(icon),
        ],
      ),
    );
  }
}

class ListofCatigories extends StatelessWidget {
  const ListofCatigories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterItem(
            title: 'Beef',
            icon: FontAwesomeIcons.cow,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Breakfast',
            icon: FontAwesomeIcons.bacon,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Chicken',
            icon: FontAwesomeIcons.drumstickBite,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Dessert',
            icon: FontAwesomeIcons.iceCream,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Goat',
            icon: FontAwesomeIcons.paw,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Lamb',
            icon: FontAwesomeIcons.paw,
          ),
          
          SizedBox(width: 10),
          FilterItem(
            title: 'Pasta',
            icon: FontAwesomeIcons.bowlFood,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Pork',
            icon: FontAwesomeIcons.piggyBank,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Seafood',
            icon: FontAwesomeIcons.fish,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Side',
            icon: FontAwesomeIcons.utensils,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Starter',
            icon: FontAwesomeIcons.pepperHot,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Vegan',
            icon: FontAwesomeIcons.leaf,
          ),
          SizedBox(width: 10),
          FilterItem(
            title: 'Vegetarian',
            icon: FontAwesomeIcons.carrot,
          ),
        ],
      ),
    );
  }
}
