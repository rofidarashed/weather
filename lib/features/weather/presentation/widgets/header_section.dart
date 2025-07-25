import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHeaderSection extends StatelessWidget {
  const BuildHeaderSection({
    super.key,
    required this.displayName,
  });
  final String? displayName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.blue[300]!, Colors.blue[600]!],
            ).createShader(bounds),
            child:  Text(
              "Hello",
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            displayName ?? "User",
            style: TextStyle(
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
