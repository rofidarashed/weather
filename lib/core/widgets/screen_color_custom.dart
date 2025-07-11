import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';

class ScreenColor extends StatelessWidget {
  const ScreenColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [AppColors.enabledBorder, Colors.transparent],
          radius: 2,
          center: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
