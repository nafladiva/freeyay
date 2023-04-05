import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class LoaderView extends StatelessWidget {
  const LoaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseShimmerLoader(height: 250, disableBorderRadius: true),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Genre',
                  style: TStyles.subheading1(),
                ),
                const SizedBox(height: 5.0),
                const BaseShimmerLoader(height: 20, width: 65),
                const SizedBox(height: 20.0),
                Text(
                  'Description',
                  style: TStyles.subheading1(),
                ),
                const SizedBox(height: 5.0),
                const BaseShimmerLoader(height: 20),
                const SizedBox(height: 5.0),
                const BaseShimmerLoader(height: 20),
                const SizedBox(height: 5.0),
                const BaseShimmerLoader(height: 20),
                const SizedBox(height: 5.0),
                const BaseShimmerLoader(height: 20),
                const SizedBox(height: 5.0),
                const BaseShimmerLoader(height: 20),
                const SizedBox(height: 20.0),
                Text(
                  'Screenshots',
                  style: TStyles.subheading1(),
                ),
                const SizedBox(height: 5.0),
                const BaseShimmerLoader(height: 200),
                const SizedBox(height: 10.0),
                const BaseShimmerLoader(height: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
