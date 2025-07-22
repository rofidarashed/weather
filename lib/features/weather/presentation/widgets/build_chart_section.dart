 import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

Widget buildChartSection(WeatherLoaded state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: glassmorphismDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Temperature Trend",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                titlesData: const FlTitlesData(show: false),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    curveSmoothness: 0.4,
                    spots: state.forecast.asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), e.value.avgTemp);
                    }).toList(),
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.05),
                        ],
                      ),
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: Colors.white,
                          strokeWidth: 2,
                          strokeColor: Colors.blue[300]!,
                        );
                      },
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.blue[200]!, Colors.white],
                    ),
                    barWidth: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

