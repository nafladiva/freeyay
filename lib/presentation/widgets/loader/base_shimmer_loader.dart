import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmerLoader extends StatelessWidget {
  const BaseShimmerLoader({
    super.key,
    required this.height,
    this.width,
    this.disableBorderRadius = false,
  });

  final double height;
  final double? width;
  final bool disableBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius:
              !disableBorderRadius ? BorderRadius.circular(10.0) : null,
        ),
      ),
    );
  }
}
