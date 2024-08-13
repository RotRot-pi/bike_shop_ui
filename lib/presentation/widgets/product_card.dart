// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:flutter/material.dart';

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
    return Container(
      transform: Matrix4.skewY(0.1),
      height: 208,
      width: 165,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
