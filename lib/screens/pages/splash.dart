import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants/constant.dart';
import 'package:mobile/screens/pages/onboarding.dart';
import 'package:mobile/screens/pages/prel_login_page.dart';
import 'package:mobile/utils/bottom_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  checkLoggedIn() {
    Future.delayed(const Duration(seconds: 2), () {
      if (box.hasData('email')) {
        Get.to(() => const BottomBar(),
            transition: Transition.zoom, duration: const Duration(seconds: 4));
      } else {
        Future.delayed(const Duration(seconds: 5), () {
          Get.to(() => const OnboardingScreen(),
              transition: Transition.cupertinoDialog,
              duration: const Duration(seconds: 7));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pathedLogo,
              const SizedBox(height: 20),
              logoText,
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
