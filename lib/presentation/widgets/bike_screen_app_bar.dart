import 'package:bike_shop_experiment/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'package:bike_shop_experiment/core/constants/colors.dart';

class BikeScreenAppBar extends StatelessWidget {
  const BikeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("BikeScreenAppBar Build");
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Choose Your Bike',
              // textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
            CustomIconButton(
              icon: Icons.search_outlined,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
