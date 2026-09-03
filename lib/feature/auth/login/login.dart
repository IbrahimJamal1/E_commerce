import 'package:e_commerce/core/service/google_auth.dart';
import 'package:e_commerce/core/validation/formvalid.dart';
import 'package:e_commerce/feature/auth/login/cubit/login_cubit.dart';
import 'package:e_commerce/feature/auth/widgets/forgetpassword.dart';
import 'package:e_commerce/feature/auth/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordHidden = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showMySnackBar(context, state.message, isError: false);
          Navigator.pushReplacementNamed(context, 'home');
        }
        if (state is LoginError) {
          showMySnackBar(context, state.message, isError: true);
        }
      },

      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("images/iconlogin.png", width: 50, height: 50),

                    const SizedBox(height: 15),

                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Sign in to continue shopping",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 40),

                    Form(
                      key: loginkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email,
                            validator: (value) {
                              return Validation.validateEmail(value);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              hintText: "you@example.com",
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email),
                            ),
                          ),

                          const SizedBox(height: 40),

                          TextFormField(
                            controller: password,
                            validator: (value) {
                              return Validation.validatepasswordlogin(value);
                            },
                            obscureText: isPasswordHidden,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              hintText: "Password",
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),

                              suffixIcon: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordHidden = !isPasswordHidden;
                                  });
                                },
                                child: Text(isPasswordHidden ? "Show" : "Hide"),
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                forgetpassword(context);
                              },
                              child: const Text("Forget Password?"),
                            ),
                          ),

                          const SizedBox(height: 16),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.blue,
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),

                              onPressed: state is LoginLoading
                                  ? null
                                  : () {
                                      if (loginkey.currentState!.validate()) {
                                        context.read<LoginCubit>().login(
                                          email: email.text.trim(),
                                          password: password.text.trim(),
                                        );
                                      }
                                    },

                              child: state is LoginLoading
                                  ? const SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator.adaptive(
                                        strokeWidth: 2.5,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    )
                                  : const Text(
                                      "Log In",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          const Center(child: Text("or continue with")),

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    try {
                                      if (!context.mounted) return;

                                      await signInWithGoogle();

                                      if (!context.mounted) return;

                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        'home',
                                        (route) => false,
                                      );
                                    } catch (e) {
                                      if (!context.mounted) return;

                                      showMySnackBar(
                                        context,
                                        e.toString(),
                                        isError: true,
                                      );
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: const Text(
                                      "G",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      'home',
                                      (rout) => false,
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: const Text(
                                      "🍎",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    print(
                                      FirebaseAuth.instance.currentUser?.uid,
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: const Text(
                                      "F",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 140),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
