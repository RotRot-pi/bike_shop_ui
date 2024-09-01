// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:bike_shop_experiment/core/constants/images.dart';
import 'package:bike_shop_experiment/presentation/widgets/custom_background.dart';
import 'package:bike_shop_experiment/presentation/widgets/custom_icon_button.dart';
import 'package:bike_shop_experiment/presentation/widgets/custom_product_bottom_card.dart';
import 'package:bike_shop_experiment/presentation/widgets/transformed_bg.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String price;
  final String image;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  double bikeImageHeight = 0.85;
  double bikeImageWidth = 0.9;
  double cardHeight = 0.15;
  bool isCardUp = false;

  Curve curve = Curves.easeInOut;
  bool isDescriptionActive = false;
  bool isSpecificationActive = false;

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
      isCardUp = isDescriptionActive || isSpecificationActive;
      if (isCardUp) {
        bikeImageHeight = 0.45;
        bikeImageWidth = 0.65;
        cardHeight = 0.55;
      } else {
        bikeImageHeight = 0.85;
        bikeImageWidth = 0.9;
        cardHeight = 0.15;
      }
    });
  }

  void handleAppBarButtonPress() {
    if (isCardUp) {
      toggleButton(isDescriptionActive ? 'description' : 'specification');
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: CustomAppBar(
                isCardUp: isCardUp,
                onButtonPressed: handleAppBarButtonPress,
                title: widget.title,
              )),
          body: Stack(
            children: [
              // const TransformedBackground(offset: Offset(100, -60)),
              const CustomBackground(),
              LayoutBuilder(builder: (context, constrains) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageContainer(
                      constrains: constrains,
                      curve: curve,
                      bikeImageHeight: bikeImageHeight,
                      bikeImageWidth: bikeImageWidth,
                      image: widget.image,
                    ),
                    CustomProductBottomCard(
                      title: widget.title,
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
    required this.image,
  });

  final Curve curve;
  final double bikeImageHeight;
  final double bikeImageWidth;
  final BoxConstraints constrains;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(vertical: 24),
      curve: curve,
      height: constrains.maxHeight * bikeImageHeight,
      width: constrains.maxWidth * bikeImageWidth,
      child: Image.asset(image),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.isCardUp,
    required this.title,
    required this.onButtonPressed,
  });

  final bool isCardUp;
  final String title;
  final VoidCallback onButtonPressed;
  @override
  Widget build(BuildContext context) {
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
              turns: isCardUp ? -0.25 : 0,
              child: CustomIconButton(
                icon: Icons.arrow_back_ios_new,
                onPressed: onButtonPressed,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
