import 'package:bike_shop_experiment/presentation/widgets/product_card.dart';
import 'package:bike_shop_experiment/presentation/widgets/products_card_shape.dart';
import 'package:flutter/material.dart';

import 'package:bike_shop_experiment/data/data.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("ProductsList Build");
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        // mainAxisSpacing: 16,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductCardShape(
            child: ProductCard(
          isFavorate: AppData.listOfProducts[index]['isFavorite'],
          title: AppData.listOfProducts[index]['title'],
          subtitle: AppData.listOfProducts[index]['subtitle'],
          price: AppData.listOfProducts[index]['price'],
          image: AppData.listOfProducts[index]['image'],
        ));
      },
      itemCount: AppData.listOfProducts.length,
    );
  }
}
