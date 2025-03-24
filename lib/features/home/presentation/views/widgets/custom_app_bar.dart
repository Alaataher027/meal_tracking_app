import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black,
      ),
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text(
                title,
                style: Styles.textStyle18.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Icon(
                FontAwesomeIcons.fire,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
