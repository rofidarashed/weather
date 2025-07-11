import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';
import 'package:weather/core/utils/strings.dart';

class CustomedAlertDialog extends StatelessWidget {
  final String content;
  const CustomedAlertDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.error),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.okay,
            style: TextStyle(color: AppColors.mainColor),
          ),
        ),
      ],
    );
  }
}
