// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../provider/image_provider.dart';
import '../utils/app_colors.dart';
import '../utils/drawer.dart';
import '../utils/upload_button.dart';
import 'pp_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? imageFileUint8List;

  @override
  Widget build(BuildContext context) {
    final PhotoProvider photoProvider = Provider.of<PhotoProvider>(context);

    var media = MediaQuery.of(context).size;

    return Scaffold(
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor1,
        onPressed: () {
          photoProvider.isImageNull()
              ? selectImageSource(context, photoProvider)
              : photoProvider.reset_all();
        },
        child: Icon(
          photoProvider.isImageNull() ? Icons.add : Icons.delete_rounded,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: AppColors.primaryBG,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Welcome to,',
          style: TextStyle(
            fontFamily: "rw",
            color: AppColors.primaryColor2,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.short_text_rounded,
                color: AppColors.primaryColor2,
                size: 50,
              ),
            );
          }),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${photoProvider.selectedCountry} Photo ID'.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "rw",
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    // color: AppColors.primaryColor2.withOpacity(0.1),
                    color: Colors.white,
                    child: InkWell(
                      highlightColor: AppColors.primaryColor2.withOpacity(0.4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          photoProvider.isImageNull()
                              ? Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        'assets/img/demo2.gif',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: media.height * 0.02,
                                ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Center(
                                  child: Text(
                                    'Your Instant Passport Size Photo Maker',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "rw",
                                      color: AppColors.primaryColor1,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // if (bgProvider.isBgNull())
                                //   Image.memory(imageFileUint8List!),

                                const Padding(
                                  padding: EdgeInsets.only(top: 5),
                                ),
                                photoProvider.isImageNull()
                                    ? UploadButton(media: media)
                                    : viewImage(media, photoProvider, context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> selectImageSource(
      BuildContext context, PhotoProvider photoProvider) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColors.primaryBG,
            title: const Text(
              'Choose Image Source',
              style: TextStyle(
                fontFamily: "rw",
                fontSize: 20,
                color: AppColors.primaryColor2,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.camera_alt_rounded,
                            color: AppColors.primaryColor2,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Camera',
                            style: TextStyle(
                              fontFamily: "rw",
                              color: AppColors.primaryColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      if (photoProvider.isImageNull()) {
                        XFile? pickedFile = await _picker
                            .pickImage(source: ImageSource.camera)
                            .catchError((err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(err.toString()),
                                backgroundColor: AppColors.primaryColor1,
                                duration: const Duration(seconds: 5)),
                          );
                          return null;
                        });
                        File? image;
                        if (pickedFile != null) {
                          image = File(pickedFile.path);
                          // picked_image = Image.file(image!);

                          photoProvider.set_edit_image(
                              await photoProvider.imageToUint8List(image));

                          // photoProvider.set_imgpath(
                          //     pickedFile.path); // to handle http request
                          photoProvider.setImage(Image.file(image));
                        }
                      } else {}
                      Navigator.pop(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.photo_library_rounded,
                            color: AppColors.primaryColor2,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Gallery',
                            style: TextStyle(
                              fontFamily: "rw",
                              color: AppColors.primaryColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      // final XFile? picked_image = await _picker.pickImage(
                      //   source: ImageSource.gallery,
                      // );
                      if (photoProvider.isImageNull()) {
                        XFile? pickedFile = await _picker
                            .pickImage(source: ImageSource.gallery)
                            .catchError((err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(err.toString()),
                                backgroundColor: AppColors.primaryColor1,
                                duration: const Duration(seconds: 5)),
                          );
                          return null;
                        });
                        File? image;
                        if (pickedFile != null) {
                          image = File(pickedFile.path);
                          // picked_image = Image.file(image!);

                          photoProvider.set_edit_image(
                              await photoProvider.imageToUint8List(image));

                          // photoProvider.set_imgpath(pickedFile.path);
                          photoProvider.setImage(Image.file(image));
                        }
                        // if (image != null) {
                        //   setState(() {
                        //     const CircularProgressIndicator();
                        //   });
                        // }
                      } else {}
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  SingleChildScrollView viewImage(
      Size media, PhotoProvider photoProvider, BuildContext context) {
    Uint8List? imageData;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          !photoProvider.is_edit_image_null() //!
              ? ClipRRect(
                  child: SizedBox(
                    // width: media.width * 0.9,
                    height: media.height * 0.5,
                    child: photoProvider.get_image_from_edit_image(),
                  ),
                )
              : Stack(
                  children: [
                    SizedBox(
                      // width: media.width * 0.9,
                      height: media.height * 0.6,
                      child: photoProvider.getImage(),
                      // child: photoProvider.get_image_from_edit_image(),
                    )
                  ],
                ),
          SizedBox(
            height: media.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const ImageProcessingPage();
                  //     },
                  //   ),
                  // );
                  var croppedImage = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: false,
                      allowSnapshotting: false,
                      builder: (context) => ImageCropper(
                        image: photoProvider.getUint8List(),
                        availableRatios: [
                          AspectRatioOption(
                            title: photoProvider.selectedCountry,
                            ratio: double.parse(photoProvider
                                    .selectedCountryHeight
                                    .toString()) /
                                double.parse(photoProvider.selectedCountryWidth
                                    .toString()),
                          )
                        ],
                      ),
                    ),
                  );
                  if (croppedImage != null) {
                    imageData = croppedImage;
                    photoProvider.set_edit_image(imageData);
                  } else {
                    Navigator.pushReplacementNamed(context, '/');
                    return;
                  }

                  var editedImage = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageEditor(
                        appBar: AppColors.primaryBG,
                        image: imageData,
                        features: const ImageEditorFeatures(
                          flip: true,
                          rotate: true,
                        ),
                      ),
                    ),
                  );
                  if (editedImage != null) {
                    imageData = editedImage;
                    photoProvider.set_edit_image(imageData);
                  } else {
                    Navigator.pushReplacementNamed(context, '/');
                    return;
                  }
                  // photoProvider.set_selected_image_count(1);
                  // photoProvider.set_aspectratio(1);
                  // photoProvider.setGreaterStatus();
                  // photoProvider.set_aspectratio(0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const pp();
                      },
                    ),
                  );
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
                child: const Text(
                  'Crop Image',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
