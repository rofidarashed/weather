import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/widgets/primary_button.dart';
import 'package:weather/features/auth/cubit/auth_cubit.dart';
import 'package:weather/features/auth/cubit/auth_state.dart';

Widget loginButton(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      return PrimaryButton(
        text: "Login to your account",
        enabled: !context.read<AuthCubit>().pending,
        onPressed: () async {
          {
            context.read<AuthCubit>().loginCubit();

            try {
              if (emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("Please fill all fields"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Okay"),
                        ),
                      ],
                    );
                  },
                );
              } else {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            } on FirebaseAuthException catch (e) {
              if (e.code == 'invalid-email' ||
                  e.code == 'invalid-credential' ||
                  e.code == 'user-not-found' ||
                  e.code == 'wrong-password') {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Invalid E-mail or Password"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Okay"),
                          ),
                        ],
                      );
                    },
                  );
                }
              } else if (e.code == "email-already-in-use") {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Invalid E-mail or Password"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Okay"),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            } finally {
              context.read<AuthCubit>().pending;
            }
          }
        },
      );
    },
  );
}
