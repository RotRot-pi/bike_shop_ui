import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.linearLightGradient,
          ),
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: 30,
        ),
      ),
    );
  }
}
