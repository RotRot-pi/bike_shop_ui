import 'dart:ui';

import 'package:bike_shop_experiment/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

import 'package:bike_shop_experiment/core/constants/colors.dart';

class ProductCardShape extends StatelessWidget {
  const ProductCardShape({
    super.key,
    // required this.isFavorate,
    // required this.title,
    // required this.subtitle,
    // required this.price,
    // required this.image,
    required this.child,
  });
  // final bool isFavorate;
  // final String title;
  // final String subtitle;
  // final String price;
  // final String image;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    print("ProductCardShape Build");
    return Container(
      width: 165,
      height: 256,
      // color: Colors.red,
      transform: Matrix4.skewY(-0.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            // color: Colors.amber,
            height: 32,
            width: 165,
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.black.withOpacity(0.2),
            shape: RectangleShapeBorder(
                border: DynamicBorderSide(
                  style: BorderStyle.solid,
                  width: 2,
                  gradient: LinearGradient(
                      transform: const GradientRotation(0.65),
                      colors: [
                        Colors.white.withAlpha(100),
                        Colors.white.withAlpha(100),
                        Colors.white.withAlpha(100),
                        Colors.black.withAlpha(75),
                        Colors.black.withAlpha(75),
                        Colors.black.withAlpha(75),
                        Colors.black.withAlpha(75),
                        Colors.black.withAlpha(75),
                        Colors.black.withAlpha(75),
                        Colors.black.withAlpha(75),
                        Colors.black.withAlpha(75),
                      ]),
                ),
                borderRadius: DynamicBorderRadius.all(
                    DynamicRadius.circular(16.toPXLength))),
            // child: BackdropFilter(
            //   filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
            child: child,
          ),
          // ),
        ],
      ),
    );
  }
}
