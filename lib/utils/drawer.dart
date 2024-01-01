// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:flutter/material.dart';
import 'app_colors.dart';

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
              // gradient: LinearGradient(
              //   colors: [
              //     AppColors.primaryBG.withOpacity(0.7),
              //     AppColors.primaryBG.withOpacity(0.9),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
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
                        // height: 80,
                        // width: 100,
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
              Icons.info_outline_rounded,
              color: AppColors.primaryColor2,
            ),
            title: const Text(
              'About',
              style: TextStyle(
                color: AppColors.primaryColor2,
              ),
            ),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name == '/about') {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(
                  context,
                  '/about',
                );
              }
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
