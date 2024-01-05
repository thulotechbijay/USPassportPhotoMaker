import 'dart:io';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: AppColors.primaryBG,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryBG,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: media.height * 0.03),
                    Expanded(
                      child: Image.asset(
                        'assets/img/logo.png',
                      ),
                    ),
                    SizedBox(height: media.height * 0.01),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              'US Photo ID',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryColor2,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: AppColors.primaryColor2,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: AppColors.primaryColor2,
              ),
            ),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name == '/') {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacementNamed(
                  context,
                  '/',
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.help_outline_rounded,
              color: AppColors.primaryColor2,
            ),
            title: const Text(
              'How to use',
              style: TextStyle(
                color: AppColors.primaryColor2,
              ),
            ),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name == '/howtouse') {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(
                  context,
                  '/howtouse',
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.handshake_rounded,
              color: AppColors.primaryColor2,
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(
                color: AppColors.primaryColor2,
              ),
            ),
            onTap: () {
              Uri.https("https://bijayrajpou.github.io/PrivacyPolicy/privacy.html");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.close_rounded,
              color: AppColors.primaryColor2,
            ),
            title: const Text(
              'Exit',
              style: TextStyle(
                color: AppColors.primaryColor2,
              ),
            ),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
