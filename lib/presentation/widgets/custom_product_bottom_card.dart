import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset_box_shadow;

import 'package:bike_shop_experiment/core/constants/colors.dart';

class CustomProductBottomCard extends StatelessWidget {
  const CustomProductBottomCard({
    super.key,
    required this.constrains,
    required this.isDescriptionActive,
    required this.isSpecificationActive,
    required this.onDescriptionPressed,
    required this.onSpecificationPressed,
    required this.cardHeight,
    required this.title,
  });
  final double cardHeight;
  final BoxConstraints constrains;
  final bool isDescriptionActive;
  final bool isSpecificationActive;
  final VoidCallback onDescriptionPressed;
  final VoidCallback onSpecificationPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: constrains.maxHeight * cardHeight,
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: AppColors.linearDarkGradient),
            borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(35, 40),
              topRight: Radius.elliptical(35, 40),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomProductCardButton(
                  title: "Description",
                  isActive: isDescriptionActive,
                  onPressed: onDescriptionPressed,
                ),
                CustomProductCardButton(
                  title: "Specification",
                  isActive: isSpecificationActive,
                  onPressed: onSpecificationPressed,
                ),
              ],
            ),
            // if (isDescriptionActive)
            DescriptionContent(
              cardHeight: cardHeight,
              isDescriptionActive: isDescriptionActive,
              title: title,
              description:
                  "The $title uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.",
            )
          ],
        ),
      ),
    );
  }
}

class DescriptionContent extends StatelessWidget {
  DescriptionContent({
    super.key,
    required this.cardHeight,
    required this.title,
    required this.description,
    required this.isDescriptionActive,
  });
  final double cardHeight;
  final String title;
  final String description;
  final bool isDescriptionActive;
  final ValueNotifier<bool> visbile = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    // Timer.periodic(const Duration(milliseconds: 500), (timer) {
    //   if (cardHeight == 0.55) {
    //     visbile.value = true;
    //   } else {
    //     visbile.value = false;
    //   }
    // });
    change() {
      if (cardHeight == 0.55) {
        Future.delayed(const Duration(milliseconds: 500), () {
          visbile.value = true;
        });
        // visbile.value = true;
      } else {
        visbile.value = false;
      }
      return visbile.value;
    }

    return ValueListenableBuilder(
        valueListenable: visbile,
        builder: (context, value, child) {
          return Visibility(
            visible: change(),
            maintainAnimation: true,
            maintainState: true,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: change() == true && isDescriptionActive ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CustomProductCardButton extends StatelessWidget {
  const CustomProductCardButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isActive,
  });
  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 43,
        width: 129,
        alignment: Alignment.center,
        decoration: isActive
            ? BoxDecoration(
                color: AppColors.fifthColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(2, 3),
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(-2, -2),
                    ),
                  ])
            : inset_box_shadow.BoxDecoration(
                color: AppColors.fifthColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                    inset_box_shadow.BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(1, 2),
                        inset: true),
                    inset_box_shadow.BoxShadow(
                      color: Colors.white.withOpacity(0.35),
                      spreadRadius: 0.45,
                      blurRadius: 1.5,
                      offset: const Offset(-1, -2),
                      inset: true,
                    )
                  ]),
        child: Text(
          title,
          style: isActive
              ? const TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                )
              : TextStyle(color: AppColors.white.withOpacity(0.6)),
        ),
      ),
    );
  }
}
