 import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

Widget buildLoadingState() {
    return Container(
      height: 400,
      decoration: glassmorphismDecoration(),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Loading weather data...",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

