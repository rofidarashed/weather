import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/utils/colors.dart';
import 'package:weather/core/utils/strings.dart';
import 'package:weather/core/widgets/password_text_field.dart';
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
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [AppColors.enabledBorder, Colors.transparent],
            radius: 2,
            center: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
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
                          SizedBox(height: 60.h),
                          Text(
                            AppStrings.createAccount,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 40.h),
                          emailInputButton(emailController: emailController),
                          SizedBox(height: 20.h),
                          PasswordTextField(
                            controller: passwordController,
                            labelText: AppStrings.password,
                          ),

                          SizedBox(height: 20.h),
                          PasswordTextField(
                            controller: repeatPasswordController,
                            labelText: AppStrings.confirmPassword,
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
      ),
    );
  }
}
