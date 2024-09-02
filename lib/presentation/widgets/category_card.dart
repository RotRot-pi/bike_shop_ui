import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'package:bike_shop_experiment/core/constants/colors.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.child,
    required this.index,
    required this.isSelected,
    required this.onPressed,
  });
  final Widget child;
  final int index;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double diagonalOffset = constraints.biggest.height;

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isSelected
                        ? AppColors.linearLightGradient
                        : AppColors.linearDarkGradient,
                  ),
                  border: GradientBoxBorder(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.white.withAlpha(50),
                          AppColors.white.withAlpha(50),
                          AppColors.primaryColor,
                          AppColors.primaryColor,
                          AppColors.primaryColor,
                          AppColors.black.withAlpha(25)
                        ],
                      ),
                      width: 0.5),
                ),
                child: Center(
                  child: child,
                ),
              ),
            ),
          ),
          diagonalOffset > 56.0
              ? Flexible(
                  child: SizedBox(
                    height: 8 * (index.toDouble() + 1),
                  ),
                )
              : const SizedBox()
        ],
      );
    });
  }
}
