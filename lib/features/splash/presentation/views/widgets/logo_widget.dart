import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_tracking_app/core/utils/styles.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.fire,
          size: 70,
        ),
        SizedBox(
          height: 180,
          width: 230,
          child: SvgPicture.asset("assets/images/calories_track.svg"),
        )
      ],
    );
  }
}
