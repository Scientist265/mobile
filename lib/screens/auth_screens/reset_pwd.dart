import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/constants/validation.dart';
import 'package:mobile/utils/custom_button.dart';
import 'package:http/http.dart' as http;
import '../../constants/constant.dart';
import '../../utils/custom_textfield.dart';
import 'login_page.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _tokenController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  void _resetPwd() async {
    final token = _tokenController.text;
    final newPassword = _passwordController.text;
    final retypeNewPassword = _retypePasswordController.text;

    var request = http.Request('PATCH',
        Uri.parse('https://pathed.onrender.com/api/v1/users/reset-password'));
    request.body = jsonEncode({
      "token": token,
      "newPassword": newPassword,
      "retypeNewPassword": retypeNewPassword
    });

    // Set the content-type header to 'application/json'
    request.headers['Content-Type'] = 'application/json';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          builder: (builder) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(
                  child: Column(
                children: [
                  const Gap(30),
                  Image.asset(
                    'assets/images/approve.png',
                  ),
                  const Gap(10),
                  const Text(
                    'Success',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Gap(7),
                  const Text(
                    'Your password has been successfully reset.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    buttonText: 'Sign in',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ));
                    },
                  )
                ],
              )),
            );
          });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is removed from the tree
    _tokenController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: defaultPadding,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 10),
              const Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please type in your email address. Steps to get a new password will be sent to you shortly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Reset Token',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              CustomTextField(
                hintText: 'enter reset token',
                controller: _tokenController,
                // suffixIcon: Icon(Icons.visibility_off),
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 10),
              const Text(
                'New Password',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              CustomTextField(
                validator: validatePassword,
                controller: _passwordController,
                prefixIcon: const Icon(Ionicons.lock_closed_outline),
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
                validator: validatePassword,
                controller: _retypePasswordController,
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 30),
              CustomButton(
                buttonText: 'Reset Password',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _resetPwd();
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
