import 'dart:ui';

import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:bike_shop_experiment/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.isFavorate,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  });
  final bool isFavorate;
  final String title, subtitle, price, image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorate;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                title: widget.title,
                subtitle: widget.subtitle,
                price: widget.price,
                image: widget.image,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 165,
        height: 256,
        transform: Matrix4.skewY(-0.1),
        child: Stack(
          children: [
            Positioned.fill(
              child: _ProductCardBackground(
                image: widget.image,
              ),
            ),
            Positioned.fill(
              // Position product info on top
              left: 16,
              right: 16,
              bottom: 16,
              child: _ProductCardInfo(
                isFavorite: _isFavorite,
                title: widget.title,
                subtitle: widget.subtitle,
                price: widget.price,
                onFavoriteTap: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Separate widget for the blurred background
class _ProductCardBackground extends StatelessWidget {
  const _ProductCardBackground({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  Colors.black.withAlpha(75),
                ]),
          ),
          borderRadius:
              DynamicBorderRadius.all(DynamicRadius.circular(16.toPXLength))),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
        child: Container(
          height: 208,
          width: 165,
          transform: Matrix4.skewY(0.1),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(85),
            ),
            color: Colors.transparent,
          ),
          child: Center(
            child: Image(
              image: ResizeImage(
                AssetImage(image),
                height: 89,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductCardInfo extends StatelessWidget {
  const _ProductCardInfo({
    required this.isFavorite,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onFavoriteTap,
  });

  final bool isFavorite;
  final String title, subtitle, price;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      transform: Matrix4.skewY(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onFavoriteTap,
                child: Icon(
                  Icons.favorite_outline_outlined,
                  size: 24,
                  color: isFavorite
                      ? AppColors.secondaryLightColor
                      : AppColors.white,
                ),
              )
            ],
          ),
          // const SizedBox(height: 8),
          const Spacer(),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style:
                TextStyle(fontSize: 13, color: AppColors.white.withAlpha(153)),
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
            style:
                TextStyle(fontSize: 13, color: AppColors.white.withAlpha(153)),
          ),
        ],
      ),
    );
  }
}
