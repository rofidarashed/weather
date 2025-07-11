import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';
import 'package:weather/core/utils/strings.dart';
import 'package:weather/core/widgets/password_text_field.dart';
import 'package:weather/core/widgets/screen_color_custom.dart';
import 'package:weather/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:weather/features/auth/presentation/widgets/email_input_button.dart';
import 'package:weather/features/auth/presentation/widgets/login_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenColor(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            AppStrings.login,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 40),
                          emailInputButton(emailController: emailController),
                          SizedBox(height: 20),
                          PasswordTextField(
                            controller: passwordController,
                            labelText: AppStrings.password,
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              AppStrings.forgotPassword,
                              style: TextStyle(color: AppColors.mainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  loginButton(
                    context,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
