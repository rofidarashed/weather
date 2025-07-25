import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/utils/strings.dart';
import 'package:weather/core/widgets/custom_alert_dialog.dart';
import 'package:weather/core/widgets/primary_button.dart';
import 'package:weather/features/auth/presentation/screens/email_sent_screen.dart';
import 'package:weather/features/auth/presentation/widgets/email_input_button.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.everyBodyForgets,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppStrings.weWillHelpYouGetRightBack,

                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      emailInputButton(emailController: emailController),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                text: AppStrings.resetPassword,
                onPressed: () async {
                  try {
                    if (emailController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomedAlertDialog(
                            content: AppStrings.pleaseEnterYourEmail,
                          );
                        },
                      );
                    } else {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text,
                      );

                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmailSent(),
                          ),
                        );
                      }
                    }
                  } on FirebaseAuthException catch (e) {
                    if (context.mounted && e.code == "user-not-found") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmailSent(),
                        ),
                      );
                    } else if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomedAlertDialog(
                            content: AppStrings.anUnexpectedErrorHasOccurred,
                          );
                        },
                      );
                    }
                  } on Exception {
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomedAlertDialog(
                            content: AppStrings.anUnexpectedErrorHasOccurred,
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
