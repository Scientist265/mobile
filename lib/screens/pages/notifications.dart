import 'package:flutter/material.dart';
import 'package:mobile/constants/constant.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                  ),
                ),
                const Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer()
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffDEE4EB),
              ),
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'There are no notification at this time',
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
