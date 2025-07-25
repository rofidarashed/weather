import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

class NotSuitabletoTraining extends StatelessWidget {
  const NotSuitabletoTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: glassmorphismDecoration(color: Colors.red.withOpacity(0.5)),
      child: Text(
        "The weather is not suitable for training ⛔",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
