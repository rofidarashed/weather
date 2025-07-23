import 'package:flutter/material.dart';
import 'package:weather/core/utils/strings.dart';
import 'package:weather/core/widgets/input_button.dart';

InputTextButton emailInputButton({
  required TextEditingController emailController,
}) {
  return InputTextButton(
    controller: emailController,
    prefixIcon: Icons.email_outlined,
    labelText: AppStrings.email,
    hintText: AppStrings.hintEmail,
  );
}
