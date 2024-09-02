import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:bike_shop_experiment/core/constants/images.dart';

class BikeCard extends StatelessWidget {
  const BikeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: RepaintBoundary(
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          shape: RectangleShapeBorder(
            border: DynamicBorderSide(
              style: BorderStyle.solid,
              // shift: 20.toPercentLength,
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
              begin: 0.toPercentLength,
              end: 100.toPercentLength,
              strokeJoin: StrokeJoin.miter,
              strokeCap: StrokeCap.square,
            ),
            cornerStyles: const RectangleCornerStyles.only(
              bottomRight: CornerStyle.straight,
            ),
            borderRadius: DynamicBorderRadius.only(
              topLeft: DynamicRadius.circular(16.toPXLength),
              topRight: DynamicRadius.circular(16.toPXLength),
              bottomLeft: DynamicRadius.circular(16.toPXLength),
              bottomRight: DynamicRadius.elliptical(
                  100.toPercentLength, 15.toPercentLength),
            ),
          ),
          child: Container(
            height: 240,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16), // Smaller top-right corner
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(85),
              ),
              color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                      child: Image.asset(AppImages.electricBike),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Expanded(
                  child: Text(
                    "30% OFF",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
