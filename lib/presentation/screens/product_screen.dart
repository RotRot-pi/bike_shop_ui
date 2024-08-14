// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math' as math;

import 'package:bike_shop_experiment/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset_box_shadow;

import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:bike_shop_experiment/presentation/widgets/custom_icon_button.dart';
import 'package:bike_shop_experiment/presentation/widgets/transformed_bg.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  double bikeImageHeight = 0.85;
  double bikeImageWidth = 0.9;
  double cardHeight = 0.15;
  double turn = 0;
  Curve curve = Curves.easeInOut;
  bool isDescriptionActive = false;
  bool isSpecificationActive = false;

  rotate() {
    setState(() {
      if (turn == 0 && cardHeight == 0.15) {
        print("turn:$turn | cardHeight:$cardHeight");
        print("POP");
      } else if (cardHeight == 0.55) {
        print("turn:$turn | cardHeight:$cardHeight");
        turn = -0.25;
      }
      // else if (turn == -0.25 && cardHeight == 0.55) {
      //   print("turn:$turn | cardHeight:$cardHeight");
      //   turn = 0;
      // }
      else {
        print("turn:$turn | cardHeight:$cardHeight");
        turn = 0;
      }
    });
  }

  void toggleButton(String buttonType) {
    setState(() {
      if (buttonType == 'description') {
        isDescriptionActive = !isDescriptionActive;
        isSpecificationActive = false;
        print("Is Description Active: $isDescriptionActive");
        print("Is Specification Active: $isSpecificationActive");
      } else {
        isSpecificationActive = !isSpecificationActive;
        isDescriptionActive = false;
        print("Is Description Active: $isDescriptionActive");
        print("Is Specification Active: $isSpecificationActive");
      }

      if (isDescriptionActive || isSpecificationActive) {
        bikeImageHeight = 0.45;
        bikeImageWidth = 0.65;
        cardHeight = 0.55;
      } else {
        bikeImageHeight = 0.85;
        bikeImageWidth = 0.9;
        cardHeight = 0.15;
      }
      rotate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //--> SafeArea
      child: Scaffold(
          //App bar
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: CustomAppBar(
                turn: turn,
                onBackButtonPressed: rotate,
              )),
          //  AppBar(
          //   //Product Name

          //   title: const Text(
          //     "Product Name",
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 20,
          //         fontFamily: 'Poppins',
          //         color: AppColors.white),
          //   ),
          //   centerTitle: true,
          //   leading: Padding(
          //     padding: const EdgeInsets.all(4.0),
          //     child: CustomIconButton(
          //         icon: Icons.arrow_back_ios_new, onPressed: () {}),
          //   ),
          // ),
          //body
          //---> Stack
          body: Stack(
            children: [
              const TransformedBackground(offset: Offset(100, -60)),
              //----> Padding
              LayoutBuilder(builder: (context, constrains) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Product Image
                    //------->AnimatedContainer (animate height) //-> Image
                    ImageContainer(
                        constrains: constrains,
                        curve: curve,
                        bikeImageHeight: bikeImageHeight,
                        bikeImageWidth: bikeImageWidth),
                    //------->AnimatedContainer (animate height) //-> Descriptoin,Price,Add to cart ... etc
                    CustomProductBottomCard(
                      constrains: constrains,
                      cardHeight: cardHeight,
                      isDescriptionActive: isDescriptionActive,
                      isSpecificationActive: isSpecificationActive,
                      onDescriptionPressed: () => toggleButton('description'),
                      onSpecificationPressed: () =>
                          toggleButton('specification'),
                    )
                  ],
                );
              })
            ],
          )),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.curve,
    required this.bikeImageHeight,
    required this.bikeImageWidth,
    required this.constrains,
  });

  final Curve curve;
  final double bikeImageHeight;
  final double bikeImageWidth;
  final BoxConstraints constrains;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(vertical: 24),
      curve: curve,
      // height: MediaQuery.sizeOf(context).height * 0.7,
      height: constrains.maxHeight * bikeImageHeight,
      width: constrains.maxWidth * bikeImageWidth,
      child: Image.asset(AppImages.robertBike),
    );
  }
}

class CustomProductBottomCard extends StatelessWidget {
  const CustomProductBottomCard({
    super.key,
    required this.constrains,
    required this.isDescriptionActive,
    required this.isSpecificationActive,
    required this.onDescriptionPressed,
    required this.onSpecificationPressed,
    required this.cardHeight,
  });
  final double cardHeight;
  final BoxConstraints constrains;
  final bool isDescriptionActive;
  final bool isSpecificationActive;
  final VoidCallback onDescriptionPressed;
  final VoidCallback onSpecificationPressed;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        // height: MediaQuery.sizeOf(context).height * 0.3,
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
              title: "PEUGEOT - LR01",
              description:
                  "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.",
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
                  ]
                //        BoxShadow(
                //             color: Colors.black.withOpacity(0.6),
                //             spreadRadius: 2,
                //             blurRadius: 4,
                //             offset: const Offset(1, 2),
                //             ),
                // BoxShadow(
                //           color: Colors.white.withOpacity(0.35),
                //           spreadRadius: 0.45,
                //           blurRadius: 1.5,
                //           offset: const Offset(-1, -2),

                //         )
                //       ]
                )
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

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.turn,
    required this.onBackButtonPressed,
  });
  final double turn;
  final VoidCallback onBackButtonPressed;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    print("Turn Value: ${widget.turn}");
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedRotation(
              duration: const Duration(milliseconds: 500),
              turns: widget.turn,
              child: CustomIconButton(
                icon: Icons.arrow_back_ios_new,
                onPressed: widget.onBackButtonPressed,
              ),
            ),
            const Text(
              "Product Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: AppColors.white),
            ),
            const SizedBox.square(
              dimension: 60,
            )
          ],
        ),
      ),
    );
  }
}
