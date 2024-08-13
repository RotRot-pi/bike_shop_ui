import 'dart:ui';

import 'package:flutter/material.dart';

class BluredBackground extends StatelessWidget {
  const BluredBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
