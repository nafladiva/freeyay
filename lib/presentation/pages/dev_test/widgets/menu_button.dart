import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.text,
    required this.routeTo,
  });

  final String text;
  final Widget routeTo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => routeTo,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Themes.primaryColor.withOpacity(0.4)),
          ),
        ),
        child: Text(
          text,
          style: TStyles.subheading1(),
        ),
      ),
    );
  }
}
