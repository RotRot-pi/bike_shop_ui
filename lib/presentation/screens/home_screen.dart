import 'package:bike_shop_experiment/presentation/widgets/bike_card.dart';
import 'package:bike_shop_experiment/presentation/widgets/bike_screen_app_bar.dart';
import 'package:bike_shop_experiment/presentation/widgets/custom_home_background.dart';
import 'package:bike_shop_experiment/presentation/widgets/custom_bot_nav_bar.dart';
import 'package:bike_shop_experiment/presentation/widgets/list_of_categories.dart';
import 'package:bike_shop_experiment/presentation/widgets/products_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomHomeBackground(),
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
