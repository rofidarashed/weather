 import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

Widget buildForecastSection(WeatherLoaded state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: glassmorphismDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "3-Day Forecast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.forecast.length,
              itemBuilder: (context, index) {
                final day = state.forecast[index];
                final isToday = index == 0;

                return AnimatedContainer(
                  duration: Duration(milliseconds: 300 + (index * 100)),
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${day.maxTemp}°',
                        style: TextStyle(
                          color: isToday ? Colors.blue[100] : Colors.blue[300],
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${day.minTemp}°',
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
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
