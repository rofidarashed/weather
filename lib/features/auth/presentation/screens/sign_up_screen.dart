import 'package:flutter/material.dart';
import 'package:weather/core/widgets/password_text_field.dart';
import 'package:weather/core/widgets/screen_color_custom.dart';
import 'package:weather/features/auth/presentation/widgets/email_input_button.dart';
import 'package:weather/features/auth/presentation/widgets/have_account_row.dart';
import 'package:weather/features/auth/presentation/widgets/signup_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool pending = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 60),
                            Text(
                              "Create your account now!",
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
                              labelText: "Password",
                            ),

                            SizedBox(height: 20),
                            PasswordTextField(
                              controller: repeatPasswordController,
                              labelText: "Confirm Password",
                            ),

                            HaveAccountRow(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  signupButton(
                    context,
                    emailController: emailController,
                    passwordController: passwordController,
                    repeatPasswordController: repeatPasswordController,
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
