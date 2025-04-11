import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeringImage extends StatelessWidget {
  const ShimmeringImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 150,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
