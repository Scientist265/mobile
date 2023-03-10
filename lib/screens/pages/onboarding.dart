import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile/constants/constant.dart';
import 'package:mobile/screens/pages/prel_login_page.dart';
import 'package:mobile/utils/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: defaultPadding,
        children: [
          const SizedBox(height: 10),
          pathedLogo,
          const SizedBox(height: 44),
          const Text(
            'All in One Go',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'Career Companion',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'We\'ll curate your career path list, based on your answers to our quiz',
            textAlign: TextAlign.center,
            style: secondaryTextStyle,
          ),
          const SizedBox(height: 54),
          const OnboardingStep(
            title: 'Discover the right path for you',
            description: 'Lots of options you can explore.',
          ),
          const OnboardingStep(
            title: 'Quickest way to find what you love',
            description: 'Get a list of career paths, based on what you love',
          ),
          const OnboardingStep(
            title: 'Turn your mobile into your personal career path guide',
            description:
                'Get a list of top schools teaching what you love in the country with PathEd.',
          ),
          const SizedBox(height: 54),
          CustomButton(
            buttonText: 'Get started',
            onTap: () {
              Get.to(() => const GuestPage(),
                  transition: Transition.circularReveal,
                  duration: const Duration(seconds: 5));
            },
          ),
        ],
      ),
    ));
  }
}

class OnboardingStep extends StatelessWidget {
  final String title, description;

  const OnboardingStep({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.verified_rounded,
            color: Color(0xff2EBA64),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
