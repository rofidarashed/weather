import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

class BuildCurrentWeatherCard extends StatelessWidget {
  const BuildCurrentWeatherCard({super.key, required this.state});
  final WeatherLoaded state;

  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
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
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                  letterSpacing: -2,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.15),
            ),
            child: const Text(
              "Today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
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
