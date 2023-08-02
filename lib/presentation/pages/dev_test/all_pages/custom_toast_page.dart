import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freeyay/common/text_styles.dart';
import 'package:oktoast/oktoast.dart';

// Lilcloser
// case: custom toast - using OKToast

class CustomToastPage extends StatelessWidget {
  const CustomToastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: OKToast(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showToastWidget(
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  // add clipBehavior for setting blur only in toast box, not entire screen
                  clipBehavior: Clip.antiAlias,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.24),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        'Nomor gagal diubah 😩',
                        style: TStyles.subheading2(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                position: ToastPosition.bottom,
              );
            },
            child: Text(
              'Show toast',
              style: TStyles.subheading2(),
            ),
          ),
        ),
      ),
    );
  }
}
