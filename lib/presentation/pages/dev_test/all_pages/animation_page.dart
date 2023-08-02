import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';

// Lilcloser
// case: add animation for cards (swipe up/down, swipe left/right)

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animation',
          style: TStyles.subheading1(color: Colors.white),
        ),
      ),
      body: SafeArea(
        // card list will be scrolled with little bit of round motion
        child: Swiper(
          itemCount: 5,
          itemBuilder: (context, index) {
            return AnimateBox(number: index);
          },
          layout: SwiperLayout.CUSTOM,
          scrollDirection: Axis.vertical,
          customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
            ..addRotate([45.0 / 180, 0.0, -45.0 / 180])
            ..addTranslate([
              Offset(10.0, -(screenHeight * 0.8)),
              const Offset(0.0, 0.0),
              Offset(10.0, (screenHeight * 0.8)),
            ]),
          itemWidth: screenWidth - 60,
          itemHeight: screenHeight * 0.6,
        ),
      ),
    );
  }
}

class AnimateBox extends StatefulWidget {
  const AnimateBox({
    super.key,
    required this.number,
  });

  final int number;

  @override
  State<AnimateBox> createState() => _AnimateBoxState();
}

class _AnimateBoxState extends State<AnimateBox>
    with SingleTickerProviderStateMixin {
  bool? isSwipeRight;

  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  )..addListener(() => setState(() {})); //have to add setState

  //the radian rotate has to be multiplied by 25
  late final animationLeft =
      Tween<Matrix4>(begin: Matrix4.rotationZ(75), end: Matrix4.identity())
          .animate(controller);

  //the radian rotate has to be multiplied by 25
  late final animationRight =
      Tween<Matrix4>(begin: Matrix4.rotationZ(-75), end: Matrix4.identity())
          .animate(controller);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // card will be rotate 45 to left/right if swipe horizontally

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Swiping in right direction
        if (details.delta.dx > 0) {
          // HapticFeedback.vibrate();
          controller.reset();
          setState(() {
            isSwipeRight = true;
          });
          controller.forward();
        }

        // Swiping in left direction
        if (details.delta.dx < 0) {
          controller.reset();
          setState(() {
            isSwipeRight = false;
          });
          controller.forward();
        }
      },
      child: AnimatedContainer(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Themes.orangeColor,
          borderRadius: BorderRadius.circular(14),
        ),
        transform: isSwipeRight != null
            ? isSwipeRight!
                ? animationRight.value
                : animationLeft.value
            : null,
        transformAlignment: Alignment.center,
        duration: controller.duration!,
        child: Center(
          child: Text(
            '${widget.number}',
            style: TStyles.heading1(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
