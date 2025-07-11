import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';
import 'package:weather/features/auth/presentation/screens/login_screen.dart';

class HaveAccountRow extends StatelessWidget {
  const HaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return LoginPage();
              },
            ),
          ),
          child: Text(
            "Log-in",
            style: TextStyle(
              color: AppColors().mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
