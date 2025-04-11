import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeringTitle extends StatelessWidget {
  const ShimmeringTitle({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 16,
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.white,
        ),
      ),
    );
  }
}
