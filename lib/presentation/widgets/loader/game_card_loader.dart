import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GameCardLoader extends StatelessWidget {
  const GameCardLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 110,
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            width: 120,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          const SizedBox(height: 4.0),
          Container(
            width: 70,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
