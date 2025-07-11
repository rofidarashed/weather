import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/widgets/primary_button.dart';
import 'package:weather/features/auth/cubit/auth_cubit.dart';
import 'package:weather/features/auth/cubit/auth_state.dart';

Widget signupButton(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController repeatPasswordController,
}) {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      return PrimaryButton(
        text: "Create your account",
        onPressed: () async {
          try {
            if (emailController.text.isEmpty ||
                passwordController.text.isEmpty ||
                repeatPasswordController.text.isEmpty) {
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
            } else if (passwordController.text !=
                repeatPasswordController.text) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text("Passwords don't match"),
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
              final credential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );

              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(credential.user!.uid)
                  .set({});

              await credential.user?.sendEmailVerification();

              if (context.mounted) {
                Navigator.pop(context);
              }
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("Password is too weak"),
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
            } else if (e.code == 'email-already-in-use') {
              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("E-mail already exists"),
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
            } else {
              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("An unknown error has occurred"),
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
          }
        },
      );
    },
  );
}
