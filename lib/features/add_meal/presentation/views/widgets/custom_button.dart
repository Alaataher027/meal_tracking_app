import 'package:flutter/material.dart';
import 'package:alaa_taher/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.title, this.onTap, this.isLodaing = false});
  final String title;
  final void Function()? onTap;
  final bool isLodaing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // width of the screen
          width: MediaQuery.of(context).size.width * 0.4,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: isLodaing
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
