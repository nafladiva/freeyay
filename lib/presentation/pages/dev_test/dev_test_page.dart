import 'package:flutter/material.dart';
import 'package:freeyay/common/text_styles.dart';

import 'all_pages/animation_page.dart';
import 'all_pages/blur_background_page.dart';
import 'all_pages/custom_toast_page.dart';
import 'widgets/widgets.dart';

class DevTestPage extends StatelessWidget {
  const DevTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dev Test',
          style: TStyles.heading1(color: Colors.white),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MenuButton(
                text: 'Flutter animate',
                routeTo: AnimationPage(),
              ),
              MenuButton(
                text: 'Background blur (bottom sheet)',
                routeTo: BlurBackgroundPage(),
              ),
              MenuButton(
                text: 'Custom toast',
                routeTo: CustomToastPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
