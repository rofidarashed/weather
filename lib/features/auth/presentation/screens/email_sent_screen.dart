import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(
                'Email has been sent',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors().white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Make sure to check your spam or junk folder.',
                style: TextStyle(color: AppColors().mainColor, fontSize: 20),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
