import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/constants/constant.dart';
import 'package:mobile/question_model/quiz_page.dart';
import 'package:mobile/screens/pages/notifications.dart';
import 'package:mobile/screens/pages/settings.dart';
import 'package:mobile/utils/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri url = Uri.parse('https://pathed.netlify.app/case-study.html');
  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  final box = GetStorage();

  // USe to Split  the email
  getName(String text) {
    var arr = text.split('@');
    return arr[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hi, ${getName(box.read('email'))}',
                    style: primaryStyle.copyWith(
                      color: Colors.black87,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(() => const NotificationPage(),
                              transition: Transition.leftToRightWithFade,
                              duration: const Duration(seconds: 1));
                        },
                        icon: const Icon(Ionicons.notifications_outline),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => const SettingsPage(),
                              transition: Transition.leftToRightWithFade,
                              duration: const Duration(seconds: 1));
                        },
                        icon: const Icon(Ionicons.settings_outline),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                  'Say hello to PathEd, the fastest growing career path guide platform.'),
              const SizedBox(height: 20),
              Image.asset('assets/images/career_structure.png'),
              const SizedBox(height: 30),
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF2F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: defaultPadding.copyWith(
                      top: 12, bottom: 12, left: 24, right: 24),
                  child: Column(
                    children: [
                      Text(
                        'Discover the future you',
                        style: primaryStyle.copyWith(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Using advanced machine learning, psychometric, and career satisfaction data, we’ve reimagined what a career test can be.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        buttonText: 'Take PathEd\'s Quiz',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.white,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(bottom: 40),
                              content: Text(
                                'Fetching Your Quiz...',
                                style:
                                    TextStyle(color: Colors.teal, fontSize: 14),
                              ),
                            ),
                          );
                          Future.delayed(const Duration(seconds: 8), () {
                            Get.to(() => const QuizPage(),
                                transition: Transition.zoom,
                                duration: const Duration(seconds: 5));
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        buttonText: 'Learn more about PathEd',
                        onTap: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.white,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: 40),
                            content: Text(
                              'Visiting pathEd Website...',
                              style: TextStyle(color: Colors.teal),
                            ),
                          ));
                          _launchUrl();
                          // ignore: deprecated_member_use
                        },
                        isColor: false,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'What we do',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF2F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '01',
                        textAlign: TextAlign.center,
                        style: primaryStyle.copyWith(
                          color: Colors.black87,
                          fontSize: 42,
                        ),
                      ),
                      const Text(
                        'We reflect upon your past experiences and future goals, and learn what makes you unique.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF2F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '02',
                        textAlign: TextAlign.center,
                        style: primaryStyle.copyWith(
                          color: Colors.black87,
                          fontSize: 42,
                        ),
                      ),
                      const Text(
                        'We find the path that\'s right for you based on your strengths, interests, skills and qualifications.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF2F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '03',
                        textAlign: TextAlign.center,
                        style: primaryStyle.copyWith(
                          color: Colors.black87,
                          fontSize: 42,
                        ),
                      ),
                      const Text(
                        'Explore the various career paths available to you. Find your dream role',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
