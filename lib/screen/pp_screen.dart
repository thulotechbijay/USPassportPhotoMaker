import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:us_photo_id/provider/image_provider.dart';
import 'package:us_photo_id/utils/app_colors.dart';
import 'package:provider/provider.dart';

class pp extends StatefulWidget {
  const pp({super.key});

  @override
  State<pp> createState() => _ppState();
}

class _ppState extends State<pp> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final PhotoProvider photoProvider = Provider.of<PhotoProvider>(context);

    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryBG,
      appBar: AppBar(
        title: const Text(
          'Passport',
          style: TextStyle(
            color: AppColors.primaryColor2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryColor2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.short_text_rounded,
                color: AppColors.primaryColor2, size: 40),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<PhotoProvider>(
              builder: (context, photoProvider, _) => SizedBox(
                child: photoProvider.isImageNull()
                    ? const Text(
                        'No Image Selected',
                        style: TextStyle(
                          color: AppColors.primaryColor1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Screenshot(
                        controller: screenshotController,
                        child: Container(
                          color: Colors.grey[200],
                          child: AspectRatio(
                            aspectRatio: 4 / 6,
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: photoProvider.get_img_count.toInt(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  // mainAxisExtent: media.height * 0.25,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 1,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 1,
                                ),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: media.width * 5,
                                    height: media.width * 5,
                                    child: photoProvider.rotate_edit_image(),
                                  );
                                }),
                          ),
                        ),
                      ),
              ),
            ),
            Slider(
              value: photoProvider.get_img_count.toDouble(),
              min: 1,
              max: 6,
              divisions: 5,
              activeColor: AppColors.primaryColor2,
              inactiveColor: AppColors.primaryColor2.withOpacity(0.5),
              onChanged: (double value) {
                photoProvider.set_img_count(value);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    photoProvider.set_isSaving(true);

                    try {
                      await ImageGallerySaver.saveImage(
                        photoProvider.get_edit_image!,
                        name: "US_Photo_ID",
                        quality: 80,
                      );

                      await Future.delayed(const Duration(seconds: 1));

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 1000),
                          backgroundColor: AppColors.primaryBG,
                          content: Text(
                            'Saved to Gallery.',
                            style: TextStyle(color: AppColors.primaryColor1),
                          ),
                        ),
                      );
                    } finally {
                      photoProvider.set_isSaving(false);
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        media.width * 0.35,
                        media.height * 0.05,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.primaryColor1,
                    ),
                  ),
                  child: photoProvider.get_isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryBG,
                            strokeWidth: 3,
                          ))
                      : const Text(
                          'Save Single',
                          style: TextStyle(color: AppColors.primaryBG),
                        ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    photoProvider.set_isSaving2(true);

                    screenshotController
                        .capture(
                            pixelRatio: 4,
                            delay: const Duration(milliseconds: 5))
                        .then((capturedImage) async {
                      await ImageGallerySaver.saveImage(capturedImage!);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 1000),
                          backgroundColor: AppColors.primaryBG,
                          content: Text(
                            'Saved to Gallery.',
                            style: TextStyle(color: AppColors.primaryColor1),
                          ),
                        ),
                      );
                    });

                    await Future.delayed(const Duration(seconds: 2));
                    photoProvider.set_isSaving2(false);
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        media.width * 0.35,
                        media.height * 0.05,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.primaryColor1,
                    ),
                  ),
                  child: photoProvider.get_isSaving2
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryBG,
                            strokeWidth: 3,
                          ))
                      : const Text(
                          'Save All',
                          style: TextStyle(color: AppColors.primaryBG),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
