import 'package:bike_shop_experiment/presentation/widgets/bike_card.dart';
import 'package:bike_shop_experiment/presentation/widgets/bike_screen_app_bar.dart';
import 'package:bike_shop_experiment/presentation/widgets/custom_background.dart';
import 'package:bike_shop_experiment/presentation/widgets/custom_bot_nav_bar.dart';
import 'package:bike_shop_experiment/presentation/widgets/list_of_categories.dart';
import 'package:bike_shop_experiment/presentation/widgets/products_list.dart';
import 'package:bike_shop_experiment/presentation/widgets/transformed_bg.dart';
import 'package:flutter/material.dart';

import 'package:bike_shop_experiment/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Main Build");
    return const Scaffold(
      // bottomNavigationBar: CustomNavBar(),
      body: SafeArea(
        child: Stack(
          children: [
            CustomBackground(),

            // BluredBackground(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 24.0),
                    sliver: BikeScreenAppBar(),
                  ),
                  BikeCard(),
                  ListOfCategoryCard(),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 24.0),
                    sliver: ProductsList(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
