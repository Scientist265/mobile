import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/constants/constant.dart';
import 'package:mobile/screens/auth_screens/login_page.dart';
import 'package:mobile/screens/pages/prel_login_page.dart';
import 'package:mobile/screens/pages/result_page.dart';
import 'package:mobile/screens/pages/settings.dart';
import 'package:mobile/question_model/quiz_page.dart';
import 'package:mobile/utils/custom_button.dart';
import 'package:mobile/utils/custom_textfield.dart';
import 'package:mobile/constants/validation.dart';
import 'package:mobile/screens/auth_screens/sign_up_page.dart';

class ListTileOptions {
  final String text;
  ListTileOptions({required this.text});
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool? check1 = false;
  //  check2 = false, check3 = false, check4 = false, check5=false;
  String? option;
  String? urSchool;

  @override
  Widget build(BuildContext context) {
    List<ListTileOptions> schools = [
      ListTileOptions(text: 'No School'),
      ListTileOptions(text: 'Primary School'),
      ListTileOptions(text: 'Secondary  School'),
      ListTileOptions(text: 'Undergraduate,University/Polytechnic'),
      ListTileOptions(text: 'Other Level '),
    ];
    void onTapped() {}
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 26,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'PathEd',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: logoColor,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Edit Your Account',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'First Name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: CustomTextField(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'John ',
                  ),
                ),
                Text(
                  'Last Name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: CustomTextField(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Doe',
                  ),
                ),
                Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: CustomTextField(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'joedoe@gmail.com',
                  ),
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: CustomTextField(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility)),
                ),
              ],
            ),
            const Text(
              'I am interested in:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Column(
              children: [
                RadioListTile(
                  activeColor: logoColor,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Explore your Career Path",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  value: "1",
                  groupValue: option,
                  onChanged: (value) {
                    setState(() {
                      option = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: logoColor,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Just Looking Around",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  value: "2",
                  groupValue: option,
                  onChanged: (value) {
                    setState(() {
                      option = value.toString();
                    });
                  },
                ),
              ],
            ),
            const Text(
              'What is your Education Level?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Column(
              children: [
                RadioListTile(
                  activeColor: const Color(0xff2EBA64),
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Primary School',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  value: "1",
                  groupValue: urSchool,
                  onChanged: (value) {
                    setState(() {
                      urSchool = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: Color(0xff2EBA64),
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Secondary School",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  value: "2",
                  groupValue: urSchool,
                  onChanged: (value) {
                    setState(() {
                      urSchool = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: const Color(0xff2EBA64),
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Undergraduate University/Polytechnic",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  value: "3",
                  groupValue: urSchool,
                  onChanged: (value) {
                    setState(() {
                      urSchool = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: Color(0xff2EBA64),
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Post Graduate",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  value: "4",
                  groupValue: urSchool,
                  onChanged: (value) {
                    setState(() {
                      urSchool = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: const Color(0xff2EBA64),
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Other Level...",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  value: "5",
                  groupValue: urSchool,
                  onChanged: (value) {
                    setState(() {
                      urSchool = value.toString();
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                buttonText: 'Update Profile',
              ),
            ),
            const Text(
              'By Signing Up to create an account, I accept PathE\'ds',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  border: Border.all(color: logoColor)),
                            ));
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Term and Services',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: logoColor,
                  ),
                ),
                const Text('and'),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  border: Border.all(color: logoColor)),
                            ));
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: logoColor,
                  ),
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  getName(String text) {
    var arr = text.split('@');
    return arr[0];
  }

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    SignUpScreen? signUp;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile_curve.png'),
                      fit: BoxFit.cover)),
            ),
            const Align(
              alignment: Alignment(0, -0.5),
              child: Text(
                'My Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const Align(
              alignment: Alignment(0, 2),
              child: CircleAvatar(
                foregroundColor: Colors.black,
                radius: 65,
                backgroundColor: Color(0xffff6b8d),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage('assets/images/my_pic.jpg')),
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${getName(box.read('email'))}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'UID:3920821287',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Manage your account and view\nyour PathEd quiz result',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileListTile(
              icon: const Icon(Icons.edit),
              onpress: () {
                Get.to(() => const ProfilePage(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(seconds: 2));
              },
              text: 'Edit your Profile',
              iconColor: const Color(0xff2EBA64),
            ),
            ProfileListTile(
              icon: const Icon(Icons.arrow_forward_ios),
              onpress: () {
                Get.to(() => const ResultPage(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(seconds: 2));
              },
              text: 'Check Quiz result',
            ),
            ProfileListTile(
              icon: const Icon(Icons.settings),
              onpress: () {
                Get.to(() => const SettingsPage(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(seconds: 2));
              },
              text: 'Settings',
            ),
            ProfileListTile(
              icon: const Icon(Icons.logout),
              onpress: () {
                box.remove('email');
                Get.offAll(() => const LogInScreen(),
                    transition: Transition.leftToRight,
                    duration: const Duration(seconds: 3));
              },
              text: 'Log Out',
              iconColor: const Color(0xff2EBA64),
              textColor: const Color(0xff2EBA64),
            )
          ],
        )
      ]),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function() onpress;
  final Color? iconColor;
  final Color? textColor;
  const ProfileListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onpress,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      leading: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      title: icon,
      iconColor: iconColor,
      textColor: textColor,
      selectedColor: iconColor,
    );
  }
}
