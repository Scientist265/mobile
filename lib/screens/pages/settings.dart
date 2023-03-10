import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/constants/constant.dart';
import 'package:mobile/screens/auth_screens/login_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: ListView(
            children: <Widget>[
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
                    'Settings',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildGroupHeader('Settings and Preference'),
              _buildListItem('Language', () => null),
              _buildListItem('Push Notifications', () => null),
              _buildGroupHeader('Support'),
              _buildListItem('Help Center', () => null),
              _buildListItem('About PathEd', () => null),
              _buildListItem('Tell a Friend', () => null),
              _buildListItem('Privacy', () => null),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: 40),
                            content: Text('You\'ve logged out'),
                          ));
                          Get.to(() => const LogInScreen(),
                              transition: Transition.upToDown,
                              duration: const Duration(seconds: 3));
                        },
                        child: Text(
                          'Sign Out',
                          style: primaryStyle.copyWith(fontSize: 16),
                        )),
                    const Icon(
                      Ionicons.log_out_outline,
                      color: logoColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupHeader(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffDEE4EB),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildListItem(String title, Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        onTap: onTap,
      ),
    );
  }
}
