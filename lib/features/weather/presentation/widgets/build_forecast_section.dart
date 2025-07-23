import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

Widget buildForecastSection(WeatherLoaded state) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: glassmorphismDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "3-Day Forecast",
          style: TextStyle(
            color: Colors.white,
            fontSize: 21.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.forecast.length,
            itemBuilder: (context, index) {
              final day = state.forecast[index];
              final isToday = index == 0;

              return AnimatedContainer(
                duration: Duration(milliseconds: 300 + (index * 100)),
                margin: EdgeInsets.only(right: 21.w),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: isToday
                      ? Colors.blue[400]!.withOpacity(0.3)
                      : Colors.white.withOpacity(0.1),
                  border: isToday
                      ? Border.all(color: Colors.blue[300]!, width: 1)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day.date,
                      style: TextStyle(
                        color: isToday ? Colors.blue[200] : Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      '${day.maxTemp}°',
                      style: TextStyle(
                        color: isToday ? Colors.blue[100] : Colors.blue[300],
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${day.minTemp}°',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
