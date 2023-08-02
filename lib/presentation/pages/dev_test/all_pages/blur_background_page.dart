import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';

// Lilcloser
// case: add blur background with a bit of black overlay and blur filter (using bottom sheet)

class BlurBackgroundPage extends StatelessWidget {
  const BlurBackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Blur background',
          style: TStyles.subheading1(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://i.kym-cdn.com/entries/icons/original/000/009/803/spongebob-squarepants-patrick-spongebob-patrick-star-background-225039.jpg',
                width: 300,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // using bottom sheet
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // IMPORTANT
                    backgroundColor:
                        Colors.black.withOpacity(0.3), //for bit dark bg
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 1.0, // fullscreen height
                        child: BackdropFilter(
                          // add blur effect
                          filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Another Page hehe',
                                  style: TStyles.heading1(color: Colors.white),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'another text for filled the page',
                                  style:
                                      TStyles.subheading2(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Open another page',
                  style: TStyles.subheading1(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
