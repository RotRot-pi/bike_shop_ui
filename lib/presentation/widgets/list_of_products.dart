import 'package:bike_shop_experiment/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

import 'package:bike_shop_experiment/data/data.dart';

class ListOfCategoryCard extends StatefulWidget {
  const ListOfCategoryCard({
    super.key,
  });

  @override
  State<ListOfCategoryCard> createState() => _ListOfCategoryCardState();
}

class _ListOfCategoryCardState extends State<ListOfCategoryCard> {
  int selectedIndex = -1; // -1 means no selection

  void _onCardPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("List Build");
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      // floating: true,
      expandedHeight: 98,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                AppData.listOfCategories.length,
                (index) => CategoriesCard(
                      child: AppData.listOfCategories[index],
                      index: index,
                      isSelected: selectedIndex == index,
                      onPressed: () => _onCardPressed(index),
                    ))
          ],
        ),
      ),
    );
  }
}
