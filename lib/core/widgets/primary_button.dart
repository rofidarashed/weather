import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.color,
  });

  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:color?? AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: Colors.black,
          elevation: 3,
        ),
        onPressed: enabled
            ? () {
                onPressed();
              }
            : null,
        child: Text(text, style: TextStyle(color: AppColors.white)),
      ),
    );
  }
}
