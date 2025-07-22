import 'package:flutter/material.dart';

class BuildHeaderSection extends StatelessWidget {
  const BuildHeaderSection({
    super.key,
    required this.displayName,
  });
  final String? displayName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.blue[300]!, Colors.blue[600]!],
            ).createShader(bounds),
            child: const Text(
              "Hello",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            displayName ?? "User",
            style: TextStyle(
              fontSize: 22,
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
