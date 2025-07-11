import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utils/strings.dart';
import 'package:weather/core/widgets/custom_alert_dialog.dart';
import 'package:weather/core/widgets/primary_button.dart';
import 'package:weather/features/auth/cubit/auth_cubit.dart';
import 'package:weather/features/auth/cubit/auth_state.dart';
import 'package:weather/features/auth/presentation/screens/login_screen.dart';

Widget signupButton(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController repeatPasswordController,
}) {
  return BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthErrorState) {
        showDialog(
          context: context,
          builder: (_) => CustomedAlertDialog(content: state.message),
        );
      } else if (state is AuthSignupSuccess) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      }
    },
    child: PrimaryButton(
      text: AppStrings.createAccount,
      onPressed: () async {
        context.read<AuthCubit>().signupCubit(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          repeatPassword: repeatPasswordController.text.trim(),
        );
      },
    ),
  );
}
