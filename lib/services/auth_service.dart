// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../screens/auth_screens/login_page.dart';
import '../utils/bottom_bar.dart';

class AuthService {
  static Future<void> signIn(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    // Get the input values from the text fields
    final email = emailController.text;
    final password = passwordController.text;

    // Send the HTTP request
    var request = http.Request(
        'POST', Uri.parse('https://pathed.onrender.com/api/v1/users/login'));

    // Encode the request body as a JSON string
    request.body = jsonEncode({
      'email': email,
      'password': password,
      'remember': true,
    });

    // Set the content-type header to 'application/json'
    request.headers['Content-Type'] = 'application/json';

    // Send the request and handle the response
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      // Request was successful
      log(await response.stream.bytesToString());
      await Get.to(() => const BottomBar(),
      transition: Transition.zoom,
          duration: const Duration(seconds: 3));
    } else {
      log(response.reasonPhrase!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ),
      );
    }
  }

  // static Future<void> signUp({
  //   required String fullName,
  //   required String email,
  //   required String password,
  //   required String retypePassword,
  // }) async {
  //   // Send the HTTP request
  //   var request = http.Request(
  //     'POST',
  //     Uri.parse('https://pathed.onrender.com/api/v1/users/register'),
  //   );

  //   // Encode the request body as a JSON string
  //   request.body = jsonEncode({
  //     'fullName': fullName,
  //     'email': email,
  //     'password': password,
  //     'retypePassword': retypePassword,
  //   });

  //   // Set the content-type header to 'application/json'
  //   request.headers['Content-Type'] = 'application/json';

  //   // Send the request and handle the response
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 201) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
}
