import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/utils/colors.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.all(23.r),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(height: 30.h),
              Text(
                'Email has been sent',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Make sure to check your spam or junk folder.',
                style: TextStyle(color: AppColors.mainColor, fontSize: 20),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
