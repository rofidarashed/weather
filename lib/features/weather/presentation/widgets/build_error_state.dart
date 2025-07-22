  import 'package:flutter/material.dart';
import 'package:weather/features/weather/presentation/widgets/glassmorphism_decoration.dart';

Widget buildErrorState(String message) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: glassmorphismDecoration(),
      child: Column(
        children: [
          Icon(Icons.cloud_off_outlined, size: 64, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            "Weather Unavailable",
            style: TextStyle(
              color: Colors.red[300],
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

