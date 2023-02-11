import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';

class YourFavoriteView extends StatelessWidget {
  const YourFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Favorites',
          style: TStyles.heading1(),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
