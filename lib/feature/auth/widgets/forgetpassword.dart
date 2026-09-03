import 'package:e_commerce/core/validation/formvalid.dart';
import 'package:e_commerce/feature/auth/login/cubit/login_cubit.dart';
import 'package:e_commerce/feature/auth/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> forgetpassword(BuildContext context) {
  final GlobalKey<FormState> resetpass = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder: (context) {
      final TextEditingController email = TextEditingController();

      return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is ResetSuccess) {
            showMySnackBar(
              context,
              "Check your email to reset your password",
              isError: false,
            );

            Navigator.pop(context);
          } else if (state is ResetError) {
            showMySnackBar(context, state.message, isError: true);
          }
        },

        builder: (context, state) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Form(
                key: resetpass,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.lock_reset_rounded,
                        size: 38,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Enter your email address and we'll send you a link to reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 25),

                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,

                      validator: (value) {
                        return Validation.validateEmail(value);
                      },

                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "you@example.com",

                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.blue,
                        ),

                        filled: true,
                        fillColor: Colors.grey.shade100,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    if (state is ResetLoading)
                      const CircularProgressIndicator()
                    else
                      SizedBox(
                        width: double.infinity,
                        height: 52,

                        child: ElevatedButton(
                          onPressed: () {
                            if (resetpass.currentState!.validate()) {
                              context.read<LoginCubit>().resetPassword(
                                email: email.text.trim(),
                              );
                            }
                          },

                          child: const Text("Send Reset Link"),
                        ),
                      ),

                    const SizedBox(height: 10),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
