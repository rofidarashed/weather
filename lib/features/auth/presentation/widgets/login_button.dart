import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utils/strings.dart';
import 'package:weather/core/widgets/custom_alert_dialog.dart';
import 'package:weather/core/widgets/primary_button.dart';
import 'package:weather/features/auth/cubit/auth_cubit.dart';
import 'package:weather/features/auth/cubit/auth_state.dart';
import 'package:weather/features/weather/presentation/screens/home_screen.dart';

Widget loginButton(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  return BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthErrorState) {
        showDialog(
          context: context,
          builder: (_) => CustomedAlertDialog(content: state.message),
        );
      } else if (state is AuthLoginSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  HomeScreen()),
        );
      }
    },
    child: PrimaryButton(
      text: AppStrings.login,
      onPressed: () {
        context.read<AuthCubit>().loginCubit(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
      },
    ),
  );
}
