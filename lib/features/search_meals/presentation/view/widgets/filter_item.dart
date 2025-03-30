import 'package:flutter/material.dart';
import 'package:alaa_taher/constants.dart';
import 'package:alaa_taher/core/utils/styles.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6,
      ),
      // width: 120,
      // height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
        color: kPrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.textStyle15,
          ),
          const SizedBox(
            width: 8,
          ),
          Icon(
            icon,
            size: 12,
          ),
        ],
      ),
    );
  }
}
