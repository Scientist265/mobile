// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:mobile/screens/auth_screens/login_page.dart';

import '../../constants/constant.dart';
import '../../constants/validation.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_textfield.dart';
import 'otp_verification.dart';
import 'package:get_storage/get_storage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  bool _isLoading = false;
  bool showText = true;
  void revealText() {
    setState(() {
      showText = !showText;
    });
  }

  void _failed() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Signup failed'),
      margin: EdgeInsets.only(bottom: 40),
    ));
  }

  void _success() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 40),
      content: Text('Sign up successfull'),
    ));
  }

  void signup() async {
    setState(() {
      _isLoading = false;
    });
    // Get the input values from the text fields
    final fullName = fullNameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final retypePassword = _retypePasswordController.text;

    // Send the HTTP request
    var request = http.Request(
        'POST', Uri.parse('https://pathed.onrender.com/api/v1/users/register'));

// Encode the request body as a JSON string
    request.body = jsonEncode({
      'fullName': fullName,
      'email': email,
      'password': password,
      'retypePassword': retypePassword,
    });

// Set the content-type header to 'application/json'
    request.headers['Content-Type'] = 'application/json';

// Send the request and handle the response
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      Future.delayed(const Duration(seconds: 1), () {});

      print(await response.stream.bytesToString());
      await Get.to(() => const OtpVerify(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 3));
      _success();
    } else {
      print(response.reasonPhrase);
      _failed();
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is removed from the tree
    fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 26),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    logoText,
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Create your Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                CustomTextField(
                  controller: fullNameController,
                  validator: (fullName) {
                    if (fullName!.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Ionicons.person_outline),
                  hintText: 'John Doe',
                ),
                const SizedBox(height: 10),
                const Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                CustomTextField(
                  controller: _emailController,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Ionicons.mail_outline),
                  hintText: 'johndoe@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                CustomTextField(
                  controller: _passwordController,
                  validator: validatePassword,
                  prefixIcon: const Icon(Ionicons.lock_closed_outline),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () => revealText(),
                      icon: showText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  keyboardType: TextInputType.text,
                  obscureText: showText,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                CustomTextField(
                  controller: _retypePasswordController,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Please retype your password';
                    }
                    if (password != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Ionicons.lock_closed_outline),

                  hintText: 'Password',
                  obscureText: showText,
                  keyboardType: TextInputType.text,

                  // suffixIcon: const Icon(Icons.visibility),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  buttonText: 'Create your account',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      fullNameController;
                      _emailController;
                      _passwordController;
                      _retypePasswordController;
                      signup();
                    }
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const LogInScreen(),
                              transition: Transition.native,
                              duration: const Duration(seconds: 3));
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xff2EBA64)),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
