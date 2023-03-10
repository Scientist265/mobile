//   import 'dart:convert';

// import 'package:flutter/material.dart';
  
//   void loadingTime() {
//     setState(() {
//       _isLoading = true;
//     });
//   }

// signIn() async {
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
