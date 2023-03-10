import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/bottom_bar.dart';

class InterestPage2 extends StatelessWidget {
  const InterestPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your Interst has been Selected',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            ElevatedButton(
              
                onPressed: () {
                  Get.to(() => const BottomBar(),
                      transition: Transition.circularReveal,
                      duration: const Duration(seconds: 3));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent,
                    foregroundColor: Colors.black),
                child: const Text('Return ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),))
          ],
        ),
      ),
    );
  }
}
