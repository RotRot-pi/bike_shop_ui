import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeBackground extends StatelessWidget {
  const CustomHomeBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomBackGroundClipper(),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.linearLightGradient)),
      ),
    );
  }
}

class CustomBackGroundClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 160);
    path.lineTo(size.width * 0.8, 100);
    path.lineTo(-25, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}