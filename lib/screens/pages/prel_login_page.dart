import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile/screens/auth_screens/sign_up_page.dart';
import 'package:mobile/utils/custom_button.dart';
import '../auth_screens/login_page.dart';
import 'package:mobile/models/privacy_policy.dart';
import 'package:gap/gap.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void popBottomBarMenu() {
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          builder: (builder) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    children: [
                      const Gap(10),
                      const Text(
                        'PathEd\'s Privacy Policy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(23),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: outline.map((e) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.header,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                e.desc,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          );
                        }).toList(),
                      )
                    ],
                  )),
            );
          });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Gap(22),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/new_logo.png'),
                    fit: BoxFit.cover),
              ),
            ),
            const Text(
              'Find the right suggestions on what to do next for you career path with our quiz.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: CustomButton(
                  buttonText: 'Log in with Email',
                  onTap: () {
                    Get.to(() => const LogInScreen(),
                        transition: Transition.downToUp,
                        duration: const Duration(seconds: 3));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New to PathEd?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreen(),
                        transition: Transition.cupertinoDialog,
                        duration: const Duration(seconds: 10));
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff2EBA64)),
                  child: const Text(
                    'Join for Free',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(100),
            Column(
              children: [
                const Text(
                  'By choosing  to create an account, I accept PathE\'ds',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        popBottomBarMenu();
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Term and Services',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff2EBA64),
                      ),
                    ),
                    const Text('and'),
                    TextButton(
                      onPressed: () {
                        popBottomBarMenu();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff2EBA64),
                      ),
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class GuestField extends StatelessWidget {
  final String imgPath;
  final String? text;
  final Function()? tap;
  const GuestField({
    super.key,
    required this.imgPath,
    required this.text,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 40,
                child: Image.asset(imgPath),
              ),
              const SizedBox(width: 10),
              Text(
                text!,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
//         child: Column(children: [
//           const Text(
//             'Enter as guest',
//             style: TextStyle(
//               fontSize: 14,
//               color: Color(logoGreen),
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           const SizedBox(
//             height: 28,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'PathEd',
//                 style: TextStyle(
//                   fontSize: 30,
//                   color: Color(logoGreen),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 'Find the right suggestions on what to do next for you career path our quiz.',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               GuestField(
//                 imgPath: 'assets/images/Apple-Logo.png',
//                 text: 'Continue with Apple',
//                 tap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Container()));
//                 },
//               ),
//               GuestField(
//                 imgPath: 'assets/images/google.png.png',
//                 text: 'Continue with Google',
//                 tap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Container()));
//                 },
//               ),
//               GuestField(
//                 imgPath: 'assets/images/fb-logo.jpg',
//                 text: 'Continue with FaceBook',
//                 tap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Container()));
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const CustomButton(buttonText: 'Log in with Email'),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'New to PathEd?',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w300,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignUpPage()));
//                     },
//                     style: TextButton.styleFrom(
//                         foregroundColor: const Color(logoGreen)),
//                     child: const Text(
//                       'Create Account',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(flex: 6),
//               const Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                         text:
//                             'By signing up to create an account, I accept PathE\'ds '),
//                     TextSpan(
//                       text: 'Terms of Service, Privacy Policy',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Color(logoGreen)),
//                     ),
//                     TextSpan(text: ' and'),
//                     TextSpan(
//                       text: ' Honor code.',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Color(logoGreen)),
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(flex: 2),
//             ],
//           ),
//         ]),
//       )),
//     );
