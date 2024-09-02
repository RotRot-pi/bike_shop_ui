import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:bike_shop_experiment/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 100,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.dstOut,
                color: AppColors.fifthColor.withOpacity(0.4),
                border: Border(
                  top: BorderSide(
                    color: Colors.grey[800]!,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (index) => _buildNavItem(index)),
              ),
            ),
          ),
          if (_currentIndex != -1)
            Positioned(
              bottom: 0,
              left: _calculateLeftPosition(),
              child: _buildElevatedIcon(_currentIndex),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final List<IconData> icons = [
      Icons.directions_bike,
      Icons.music_note,
      Icons.shopping_cart_outlined,
      Icons.person,
      MdiIcons.fileDocument,
    ];

    return _currentIndex == index
        ? const SizedBox(
            height: 60,
            width: 60,
          )
        : GestureDetector(
            onTap: () => setState(() => _currentIndex = index),
            child: Container(
              width: 60,
              height: 60,
              color: Colors.transparent,
              child: Icon(
                icons[index],
                size: 24,
                color: _currentIndex == index
                    ? const Color(0xFF56C9FF)
                    : Colors.white.withOpacity(0.5),
              ),
            ),
          );
  }

  Widget _buildElevatedIcon(int index) {
    final List<IconData> icons = [
      Icons.directions_bike,
      Icons.music_note,
      Icons.shopping_cart_outlined,
      Icons.person,
      MdiIcons.fileDocument,
    ];

    return Container(
      width: 60,
      height: 60,
      transform: Matrix4.skewY(-0.3),
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.linearLightGradient,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Transform(
        transform: Matrix4.skewY(0.3),
        child: Icon(
          icons[index],
          size: 28,
          color: AppColors.white,
        ),
      ),
    );
  }

  double _calculateLeftPosition() {
    const double itemWidth = 72.0;
    const double startPadding = 16.0;
    return startPadding + (_currentIndex * itemWidth) + (itemWidth - 60) / 2;
  }
}
