import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';

class MyChip extends StatelessWidget {
  const MyChip({
    required this.text,
    this.textStyle,
    this.padding,
    this.color,
    super.key,
  });

  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 9.0, vertical: 3.0),
      decoration: BoxDecoration(
        border: Border.all(color: color ?? Colors.orange),
        color: (color ?? Colors.orange).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        text,
        style: TStyles.subheading3(color: color ?? Colors.orange),
      ),
    );
  }
}
