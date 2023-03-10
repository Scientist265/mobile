import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/question_model/schools.dart';
import 'package:mobile/screens/pages/notifications.dart';
import 'package:mobile/screens/pages/settings.dart';
import 'package:mobile/utils/bottom_bar.dart';
import 'package:mobile/utils/custom_button.dart';
import 'package:mobile/utils/custom_textfield.dart';

import '../../question_model/question_model.dart';

class Degree {
  final String program;
  final String course;
  Degree({required this.program, required this.course});
}

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final box = GetStorage();
  getName(String text) {
    var arr = text.split('@');
    return arr[0];
  }

  @override
  Widget build(BuildContext context) {
    Future popDialog() => showDialog(
        context: context,
        builder: (context) => Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: SimpleDialog(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 22,
                                color: Colors.black,
                              ))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Share with your Friends',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ShareWithWidget(
                        icon: Icons.copy,
                        onpress: () {},
                        platform: 'copy link',
                      ),
                      ShareWithWidget(
                        icon: Icons.mail,
                        onpress: () {},
                        platform: 'Email',
                      ),
                      ShareWithWidget(
                        icon: Icons.mail,
                        onpress: () {},
                        platform: 'twitter',
                      ),
                      ShareWithWidget(
                        icon: Icons.facebook,
                        onpress: () {},
                        platform: 'facebook',
                      ),
                      ShareWithWidget(
                        icon: Icons.linked_camera,
                        onpress: () {},
                        platform: 'LinkedIn',
                      ),
                    ],
                  ),
                ),
              ]),
            ));
    List<Degree> degreeList = [
      Degree(program: 'Bachelors,', course: 'Pharmacology'),
      Degree(program: 'Bachelors,', course: 'Forensic Science'),
      Degree(program: 'Bachelors,', course: 'Agro Allied'),
      Degree(program: 'Bachelors,', course: 'Computer Engineering'),
      Degree(program: 'Bachelors,', course: 'Economics'),
      Degree(program: 'Bachelors,', course: 'Computer Science'),
      Degree(program: 'Bachelors,', course: 'Petrochemical Engineering'),
    ];
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color(0xff3AA370),
      // ignore: prefer_const_constructors
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 33, left: 12, right: 8, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${getName(box.read('email'))}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.to(
                        () => const NotificationPage(),
                        transition: Transition.zoom,
                      );
                    },
                    icon: const Icon(
                      Ionicons.notifications_outline,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(
                        () => const SettingsPage(),
                        transition: Transition.zoom,
                      );
                    },
                    icon: const Icon(
                      Ionicons.settings_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Here is your curated PathEd\'s result.',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  const Text(
                    'Share',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {
                      popDialog();
                    },
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(20),
                  const Text(
                    'Your Top Career Paths',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const ReUsableWidget(
                    career: 'Dentist',
                    imgPath: 'assets/images/dentist.jpg',
                  ),
                  const ReUsableWidget(
                    career: 'SoftWare Engineer',
                    imgPath: 'assets/images/software.jpg',
                  ),
                  const ReUsableWidget(
                    career: 'Lawyer',
                    imgPath: 'assets/images/lawyer.jpg',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Your Top Degrees',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: degreeList.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.program,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              e.course,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Your Top Skills',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Negotiation',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Attention to detail ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Crafty',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your School Offering your Course In Nigeria',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'University Of Port Harcout',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'University Of Abuja ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'NNsuka',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Text(
                    'Top Interest',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Writing',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Singing ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Coding',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttonText: 'Done',
                    onTap: () {
                      Get.to(() => const BottomBar(),
                          transition: Transition.fade,
                          duration: const Duration(seconds: 3));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ShareWithWidget extends StatelessWidget {
  final Function() onpress;
  IconData icon;
  final String platform;
  ShareWithWidget({
    super.key,
    required this.onpress,
    required this.icon,
    required this.platform,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              platform,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class ReUsableWidget extends StatelessWidget {
  final String career;
  final String imgPath;
  const ReUsableWidget({
    super.key,
    required this.career,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover),
                  border: Border.all(
                    color: const Color(0xff3AA370),
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.68,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff3AA370),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  career,
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
