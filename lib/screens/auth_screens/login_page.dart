// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/constants/validation.dart';
import 'package:mobile/screens/auth_screens/sign_up_page.dart';
import 'package:mobile/services/auth_service.dart';

import '../../constants/constant.dart';
import '../../utils/custom_button.dart';
import '../../utils/custom_textfield.dart';
import 'forgot_password.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  bool showText = true;
  void revealText() {
    setState(() {
      showText = !showText;
    });
  }

  final box = GetStorage();

//   Future<void> _signIn() async {
//     loadingTime();

//     // Get the input values from the text fields
//     final email = _emailController.text;
//     final password = _passwordController.text;

//     // Send the HTTP request
//     var request = http.Request(
//         'POST', Uri.parse('https://pathed.onrender.com/api/v1/users/login'));

// // Encode the request body as a JSON string
//     request.body = jsonEncode({
//       'email': email,
//       'password': password,
//       'remember': true,
//     });

// // Set the content-type header to 'application/json'
//     request.headers['Content-Type'] = 'application/json';

// // Send the request and handle the response
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       // Request was successful
//       log(await response.stream.bytesToString());
//       await Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const BottomBar(),
//           ));
//     } else {
//       log(response.reasonPhrase!);
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const LogInScreen(),
//         ),
//       );
//     }
//   }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Form(
            key: _formKey,
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Color(0xff2EBA64),
                  ))
                : ListView(
                    children: [
                      const SizedBox(
                        height: 26,
                      ),
                      const Column(
                        children: [
                          logoText,
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Login to your Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                        validator: validateEmail,
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
                                ? const Icon(Ionicons.eye_outline)
                                : const Icon(Ionicons.eye_off_outline)),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: showText,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const ForgotPassword(),
                                  transition: Transition.fade,
                                  duration: const Duration(seconds: 3));
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: const Color(0xff2EBA64)),
                            child: const Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        buttonText: 'Log in',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _emailController;
                            _passwordController;
                            box.write('email', _emailController.text);
                            setState(() {
                              _isLoading = true;
                            });

                            AuthService.signIn(
                                context, _emailController, _passwordController);
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'You don\'t have an account?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xff2EBA64)),
                              child: const Text(
                                'Register Here',
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
