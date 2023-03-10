import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/screens/auth_screens/reset_pwd.dart';
import 'package:mobile/utils/custom_button.dart';

import '../../constants/validation.dart';
import '../../utils/custom_textfield.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  // bool _isLoading = false;

  void _forgetPwd() async {
    // Get the input values from the text fields
    final email = _emailController.text.trim();

    // Send the HTTP request
    var request = http.Request('POST',
        Uri.parse('https://pathed.onrender.com/api/v1/users/forgot-password'));

// Encode the request body as a JSON string
    request.body = jsonEncode({
      "email": email,
    });

// Set the content-type header to 'application/json'
    request.headers['Content-Type'] = 'application/json';

// Send the request and handle the response
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase!);
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is removed from the tree
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff2EBA64),
                  ),
                  label: const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2EBA64),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Kindly enter your email address here, a code\nwould be sent to you shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              CustomTextField(
                validator: validateEmail,
                controller: _emailController,
                hintText: 'xyz@gmail.com',
                prefixIcon: const Icon(
                  Ionicons.person_outline,
                  size: 20,
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                buttonText: 'Send',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _emailController;
                    _forgetPwd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPassword(),
                        ));
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
