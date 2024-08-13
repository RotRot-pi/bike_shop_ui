import 'package:bike_shop_experiment/core/app_theme.dart';
import 'package:bike_shop_experiment/presentation/screens/home_screen.dart';
import 'package:bike_shop_experiment/presentation/screens/product_screen.dart';
import 'package:bike_shop_experiment/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  debugInvertOversizedImages = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: const ProductScreen(),
    );
  }
}
