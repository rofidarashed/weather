import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

class BuildCurrentWeatherCard extends StatelessWidget {
  const BuildCurrentWeatherCard({super.key, required this.state});
  final WeatherLoaded state;

  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      padding: EdgeInsets.all(28.r),
      decoration: glassmorphismDecoration(),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: state.forecast[0].avgTemp),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Text(
                '${value.toInt()}°',
                style:  TextStyle(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                  letterSpacing: -2,
                ),
              );
            },
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.15),
            ),
            child:  Text(
              "Today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
