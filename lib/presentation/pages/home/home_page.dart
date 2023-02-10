import 'package:flutter/material.dart';

import 'views/views.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          children: const [
            LiveGameView(),
            SizedBox(height: 30.0),
            GamesByPlatformView(),
          ],
        ),
      ),
    );
  }
}
