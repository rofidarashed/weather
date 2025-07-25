 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BoxDecoration glassmorphismDecoration({Color? color}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      color: color??Colors.white.withOpacity(0.1),
      border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }
