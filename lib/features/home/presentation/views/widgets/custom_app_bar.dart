import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_tracking_app/core/utils/app_router.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: Styles.textStyle18.copyWith(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.KSearchView);
              },
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
