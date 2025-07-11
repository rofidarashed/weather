import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';
import 'package:weather/core/utils/strings.dart';
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
        Text(AppStrings.alreadyHaveAnAccount),
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
            AppStrings.loginText,
            style: TextStyle(
              color: AppColors.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
