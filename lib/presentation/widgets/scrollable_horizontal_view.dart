import 'package:flutter/material.dart';
import 'package:freeyay/common/text_styles.dart';

class ScrollableHorizontalView extends StatelessWidget {
  const ScrollableHorizontalView({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...children,
          Column(
            children: [
              const Icon(
                Icons.chevron_right,
                size: 30.0,
              ),
              Text(
                'See more',
                style: TStyles.subheading2(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
