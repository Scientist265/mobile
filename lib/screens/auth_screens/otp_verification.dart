import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';
import 'package:mobile/screens/auth_screens/login_page.dart';
import 'package:mobile/utils/custom_button.dart';
import 'package:http/http.dart' as http;

import '../../utils/otp_countdown.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({Key? key}) : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  String? _enteredToken;

  _success() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Otp successfully verified')));

    // ignore: use_build_context_synchronously
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const SizedBox(
                    height: 50,
                  ),
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
                    'You have successfully created your account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    buttonText: 'Let\'s Begin',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ));
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  _failed() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Otp not verfied')));
  }

  void _otpVerify() async {
    if (_enteredToken == null) {
      print('Can\'t be null');
    } else {
      var request = http.Request('PATCH',
          Uri.parse('https://pathed.onrender.com/api/v1/users/verify'));

      request.body = jsonEncode({
        'token': _enteredToken,
      });

      request.headers['Content-Type'] = 'application/json';

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        await _success();
      } else {
        print(response.reasonPhrase);
        _failed();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
              const Spacer(flex: 1),
              const Text(
                'Verification',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Enter the code sent to your email here.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(flex: 2),
              VerificationCode(
                keyboardType: TextInputType.number,
                underlineColor: const Color(0xff2EBA64),
                length: 4,
                onCompleted: (value) {
                  setState(() {
                    _enteredToken = value;
                  });
                },
                onEditing: (value) {},
              ),
              const SizedBox(height: 20),
              const MyCountdown(),
              const SizedBox(height: 40),
              CustomButton(
                buttonText: 'Enter',
                onTap: () {
                  _otpVerify();
                },
              ),
              const SizedBox(height: 20),
              const Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}
