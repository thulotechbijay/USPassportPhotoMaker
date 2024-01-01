// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:us_photo_id/utils/app_colors.dart';
import 'package:us_photo_id/utils/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.primaryBG,
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text("About Us",
              style: TextStyle(color: AppColors.primaryColor1)),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.primaryColor1,
              )),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.short_text_rounded,
                  color: AppColors.primaryColor2,
                  size: 45,
                ),
              );
            }),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Divider(
                  color: AppColors.whiteColor.withOpacity(0.5),
                  thickness: 2,
                ),
                const SizedBox(height: 7.0),
                const SizedBox(height: 10.0),
                Image.asset(
                  'assets/img/logo.png',
                  width: media.width * 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12.0),
                  child: const Text(
                    'US Photo ID is a mobile application that allows users to create French  passport size photos  from their mobile phones. It is a simple and easy-to-use application that allows users to create US passport size photos in just a few clicks. It is a free application that can be used by anyone.',
                    style: TextStyle(
                        fontSize: 18.0, color: AppColors.primaryColor1),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),

                // details about company
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      color: Color.fromARGB(255, 48, 59, 97),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'Thulo Technology Pvt. Ltd.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: AppColors.primaryColor1,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          child: Text(
                            'Thulo Technology is a software development company that specializes in mobile application development. It is a team of highly motivated and skilled individuals who are passionate about creating innovative solutions to real-world problems.',
                            style: TextStyle(
                                fontSize: 18.0, color: AppColors.primaryColor1),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      color: AppColors.primaryColor1,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Contact Us For App Development',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            // color: Colors.black.withOpacity(0.5),
                            color: AppColors.primaryBG,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // email
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // ignore: deprecated_member_use
                                launch('mailto:info@thulotechnology.com'
                                    '?subject=US Photo ID&body=Hello Thulo Technology, ');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.email,
                                    size: 40,
                                    color: AppColors.primaryBG,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                // ignore: deprecated_member_use
                                launch('tel:+977-9809373860');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.phone,
                                    size: 40,
                                    color: AppColors.primaryBG,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                // ignore: deprecated_member_use
                                launch('https://thulotechnology.com/');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.language,
                                    size: 40,
                                    color: AppColors.primaryBG,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
