import 'package:flutter/material.dart';
import 'package:freeyay/common/text_styles.dart';

class ChipButton extends StatelessWidget {
  const ChipButton({
    required this.text,
    required this.onTap,
    this.textStyle,
    this.padding,
    this.color,
    super.key,
  });

  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 7.0),
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: color ?? Colors.orange,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TStyles.subheading2(color: Colors.white),
        ),
      ),
    );
  }
}
