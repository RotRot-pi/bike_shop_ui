import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:bike_shop_experiment/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppData {
  static List listOfCategories = [
    const Text(
      "All",
      style: TextStyle(fontSize: 13, color: AppColors.white),
    ),
    Icon(
      Icons.battery_charging_full_outlined,
      color: AppColors.white.withOpacity(0.6),
      size: 30,
    ),
    Icon(
      MdiIcons.highway,
      color: AppColors.white.withOpacity(0.6),
      size: 30,
    ),
    Icon(
      Icons.landscape,
      color: AppColors.white.withOpacity(0.6),
      size: 30,
    ),
    Icon(
      Icons.sports_motorsports_outlined,
      color: AppColors.white.withOpacity(0.6),
      size: 30,
    ),
  ];
  static List<Map<String, dynamic>> listOfProducts = [
    {
      "image": AppImages.electricBike,
      "title": "Road Bike",
      "subtitle": "PEUGEOT - LR01",
      "price": "\$ 1,999.00",
      "isFavorite": true
    },
    {
      "image": AppImages.helmet,
      "title": "Road helmet",
      "subtitle": "SMITH - Trade",
      "price": "\$ 120.00",
      "isFavorite": false
    },
    {
      "image": AppImages.mikkelBike,
      "title": "Road Bike",
      "subtitle": "MOZILA - LR01",
      "price": "\$ 1,250.00",
      "isFavorite": false
    },
    {
      "image": AppImages.robertBike,
      "title": "Montain Bike",
      "subtitle": "KAWASAKI - SH01",
      "price": "\$ 3,150.00",
      "isFavorite": false
    },
    {
      "image": AppImages.electricBike,
      "title": "Road Bike",
      "subtitle": "PEUGEOT - LR01",
      "price": "\$ 1,999.00",
      "isFavorite": true
    },
    {
      "image": AppImages.helmet,
      "title": "Road helmet",
      "subtitle": "SMITH - Trade",
      "price": "\$ 120.00",
      "isFavorite": false
    },
    {
      "image": AppImages.mikkelBike,
      "title": "Road Bike",
      "subtitle": "MOZILA - LR01",
      "price": "\$ 1,250.00",
      "isFavorite": false
    },
    {
      "image": AppImages.robertBike,
      "title": "Montain Bike",
      "subtitle": "KAWASAKI - SH01",
      "price": "\$ 3,150.00",
      "isFavorite": false
    },
    {
      "image": AppImages.electricBike,
      "title": "Road Bike",
      "subtitle": "PEUGEOT - LR01",
      "price": "\$ 1,999.00",
      "isFavorite": true
    },
    {
      "image": AppImages.helmet,
      "title": "Road helmet",
      "subtitle": "SMITH - Trade",
      "price": "\$ 120.00",
      "isFavorite": false
    },
    {
      "image": AppImages.mikkelBike,
      "title": "Road Bike",
      "subtitle": "MOZILA - LR01",
      "price": "\$ 1,250.00",
      "isFavorite": false
    },
    {
      "image": AppImages.robertBike,
      "title": "Montain Bike",
      "subtitle": "KAWASAKI - SH01",
      "price": "\$ 3,150.00",
      "isFavorite": false
    },
    {
      "image": AppImages.electricBike,
      "title": "Road Bike",
      "subtitle": "PEUGEOT - LR01",
      "price": "\$ 1,999.00",
      "isFavorite": true
    },
    {
      "image": AppImages.helmet,
      "title": "Road helmet",
      "subtitle": "SMITH - Trade",
      "price": "\$ 120.00",
      "isFavorite": false
    },
    {
      "image": AppImages.mikkelBike,
      "title": "Road Bike",
      "subtitle": "MOZILA - LR01",
      "price": "\$ 1,250.00",
      "isFavorite": false
    },
    {
      "image": AppImages.robertBike,
      "title": "Montain Bike",
      "subtitle": "KAWASAKI - SH01",
      "price": "\$ 3,150.00",
      "isFavorite": false
    },
    {
      "image": AppImages.electricBike,
      "title": "Road Bike",
      "subtitle": "PEUGEOT - LR01",
      "price": "\$ 1,999.00",
      "isFavorite": true
    },
    {
      "image": AppImages.helmet,
      "title": "Road helmet",
      "subtitle": "SMITH - Trade",
      "price": "\$ 120.00",
      "isFavorite": false
    },
    {
      "image": AppImages.mikkelBike,
      "title": "Road Bike",
      "subtitle": "MOZILA - LR01",
      "price": "\$ 1,250.00",
      "isFavorite": false
    },
    {
      "image": AppImages.robertBike,
      "title": "Montain Bike",
      "subtitle": "KAWASAKI - SH01",
      "price": "\$ 3,150.00",
      "isFavorite": false
    },
  ];
}
