// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/drawer.dart';

class HowToUse extends StatefulWidget {
  const HowToUse({super.key});

  @override
  State<HowToUse> createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryBG,
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text("How to use",
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
                icon: const Icon(
                  Icons.short_text_rounded,
                  color: AppColors.primaryColor2,
                  size: 45,
                ),
              );
            }),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Here is how you can easily create your own passport photo:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryColor1,
                      ),
                    ),
                  ),
                  HowToCard(
                      step:
                          "1. Select a photo from your gallery or take a new photo.",
                      note:
                          "Note: The photo must be in good quality and half body photo with a plain white background."),
                  HowToCard(
                      step: "2. Crop the photo to your liking.",
                      note:
                          "Note: Crop photo to the size of the frame and make sure the face is in the center of the frame."),
                  HowToCard(
                      step: "3. Adjust the photo to fit the frame.",
                      note:
                          "Adjust the photo to fit the frame by pinching in or out."),
                  HowToCard(
                      step: "4. Save the photo to your gallery.",
                      note: "Note: The photo will be saved in your Gallery."),
                ],
              ),
            ),
          ],
        ));
  }
}

class HowToCard extends StatelessWidget {
  final String step;
  final String note;

  const HowToCard({
    required this.step,
    required this.note,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor1,
      child: Padding(
        padding: const EdgeInsets.only(top: 1, bottom: 10, left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              step,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              note,
              textAlign: TextAlign.center,
              style: TextStyle(
                  // color: Colors.white
                  // fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
