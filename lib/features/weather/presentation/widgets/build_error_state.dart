  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

Widget buildErrorState(String message) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: glassmorphismDecoration(),
      child: Column(
        children: [
          Icon(Icons.cloud_off_outlined, size: 64.r, color: Colors.red[300]),
           SizedBox(height: 16.h),
          Text(
            "Weather Unavailable",
            style: TextStyle(
              color: Colors.red[300],
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
           SizedBox(height: 8.h),
          Text(
            message,
            style:  TextStyle(color: Colors.white70, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

