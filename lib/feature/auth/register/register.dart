import 'package:e_commerce/core/service/imageurl.dart';
import 'package:e_commerce/core/service/imagepaker.dart';
import 'package:e_commerce/core/validation/formvalid.dart';
import 'package:e_commerce/feature/auth/register/cubit/register_cubit.dart';
import 'package:e_commerce/feature/auth/widgets/heatregister.dart';
import 'package:e_commerce/feature/auth/widgets/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  XFile? selectedImage;
  bool checkboxvalue = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? imageUrl;
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    selectedImage = null;
    imageUrl = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showMySnackBar(context, state.message, isError: false);
          Navigator.pushNamed(context, 'login');
        }
        if (state is RegisterError) {
          showMySnackBar(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Create Account",
              style: TextStyle(fontWeight: FontWeight(800)),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(20),

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Join ShopFlow",
                    style: TextStyle(fontWeight: FontWeight(800), fontSize: 26),
                  ),
                  Text("Create your account in seconds"),
                  SizedBox(height: 30),

                  Form(
                    key: registerKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headregister(selectedImage, () async {
                          final XFile? image = await profileimage();

                          if (image != null) {
                            setState(() {
                              selectedImage = image;
                            });

                            imageUrl = await CloudinaryService().uploadImage(
                              image,
                            );
                          }
                        }),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: name,
                          validator: (value) {
                            return Validation.validatename(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            hintText: "ibrahim gamal",
                            labelText: "Full Name",
                            prefixIcon: const Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 30),
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
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            hintText: "you@example.com",
                            labelText: "Email",
                            prefixIcon: const Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: phone,
                          validator: (value) {
                            return Validation.validatephone(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            hintText: "01XXXXXXXXX",
                            labelText: "Phone",
                            prefixIcon: const Icon(Icons.phone),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            return Validation.validatePasswordregister(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            hintText: "Password",
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.password_rounded),
                          ),
                        ),

                        SizedBox(height: 20),
                        FormField<bool>(
                          initialValue: false,
                          validator: (value) {
                            if (value != true) {
                              return 'You must agree to the Terms of Service and Privacy Policy';
                            }
                            return null;
                          },
                          builder: (field) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CheckboxListTile(
                                  value: field.value ?? false,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (val) {
                                    field.didChange(val);
                                  },
                                  title: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: "I agree to ShopFlow's ",
                                        ),

                                        TextSpan(
                                          text: "Terms of Service",
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer(),
                                        ),

                                        const TextSpan(text: " and "),

                                        TextSpan(
                                          text: "Privacy Policy",
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                if (field.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      field.errorText!,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      onPressed: state is RegisterLoading
                          ? null
                          : () {
                              if (registerKey.currentState?.validate() ??
                                  false) {
                                if (selectedImage == null) {
                                  showMySnackBar(
                                    context,
                                    'Please select a profile image',
                                    isError: true,
                                  );
                                  return;
                                }
                                context.read<RegisterCubit>().register(
                                  email: email.text.trim(),
                                  password: password.text.trim(),
                                  phone: phone.text.trim(),
                                  name: name.text.trim(),
                                  pathimage: imageUrl.toString(),
                                );
                              }
                            },

                      child: state is RegisterLoading
                          ? const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2.5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: Text("Sign In"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
