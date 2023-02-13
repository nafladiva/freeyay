import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';

class ScrollableHorizontalView extends StatelessWidget {
  const ScrollableHorizontalView({
    required this.children,
    super.key,
  }) : isEnableSeeMore = false;

  const ScrollableHorizontalView.seeMore({
    required this.children,
    super.key,
  }) : isEnableSeeMore = true;

  final List<Widget> children;
  final bool isEnableSeeMore;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...children,
          if (isEnableSeeMore) ...[
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
        ],
      ),
    );
  }
}
