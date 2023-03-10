import 'package:flutter/material.dart';
import 'package:mobile/question_model/quiz_page.dart';
import 'package:mobile/utils/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
              ],
            ),
            const Text(
              'Welcome \n User,',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Answer a few questions and our app would provide suggested career paths, curated just for you.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(buttonText: 'Get Started', onTap: () => QuizPage()),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'How it works,',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'A career path suggestion tool, providing solutions for your next level, using the answers you provide to our quiz.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/career_structure.png'),
          ],
        ),
      ),
    );
  }
}
