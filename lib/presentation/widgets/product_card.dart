// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:bike_shop_experiment/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.isFavorate,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  });
  final bool isFavorate;
  final String title;
  final String subtitle;
  final String price;
  final String image;
  @override
  Widget build(BuildContext context) {
    print("ProductCard Build");
    return GestureDetector(
      onTap: () {
        //Todo: Make a slide transition to the next screen
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: ProductScreen(
                title: title,
                subtitle: subtitle,
                price: price,
                image: image,
              ),
            ),
          ),
        );
      },
      child: Container(
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
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                child: Container(
                  transform: Matrix4.skewY(0.1),
                  height: 208,
                  width: 165,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16), // Smaller top-right corner
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(85),
                    ),
                    color: Colors.transparent,
                  ),
                  child: ProductInfo(
                      isFavorate: isFavorate,
                      image: image,
                      title: title,
                      subtitle: subtitle,
                      price: price),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.isFavorate,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  final bool isFavorate;
  final String image;
  final String title;
  final String subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.favorite_outline_outlined,
              size: 24,
              color:
                  isFavorate ? AppColors.secondaryLightColor : AppColors.white,
            )
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Image(
              image: ResizeImage(
            AssetImage(image),
            height: 89,
          )),
        ),
        // Container(
        //     alignment: Alignment.center,
        //     height: 88.75,
        //     child: Image.asset(
        //       image,
        //     )),
        // const SizedBox(
        //   height: 16,
        // ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 13, color: AppColors.white.withAlpha(153)),
            ),
            Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
            Text(
              '\$ $price',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 13, color: AppColors.white.withAlpha(153)),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        )
      ],
    );
  }
}
