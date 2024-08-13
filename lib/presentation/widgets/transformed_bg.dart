import 'package:bike_shop_experiment/core/constants/images.dart';
import 'package:flutter/material.dart';

class TransformedBackground extends StatelessWidget {
  const TransformedBackground({
    super.key,
    required this.offset,
  });
  final Offset offset;
  @override
  Widget build(BuildContext context) {
    print("Transformed Build");
    return RepaintBoundary(
      child: Transform.translate(
        offset: offset,
        child: Image.asset(
          AppImages.blueBg,
          fit: BoxFit.fill,

          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
