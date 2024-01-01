// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class PhotoProvider extends ChangeNotifier {
  // change this as per your requirement
  final selectedCountry = 'US';
  final selectedCountryHeight = 50;
  final selectedCountryWidth = 50;

  Image? _picked_image;

  Image? get picked_image => _picked_image;

  void setImage(Image? pickedImage) {
    _picked_image = pickedImage;
    notifyListeners();
  }

  Uint8List? editImage;
  Uint8List? get get_edit_image => editImage;
  void set_edit_image(Uint8List? imageData) {
    editImage = imageData;
    notifyListeners();
  }

  Image get_image_from_edit_image() {
    return Image.memory(
      editImage!,
      // fit: BoxFit.fill,
      // height: 90,
      // width: 70,
    );
  }

  Widget rotate_edit_image() {
    return Transform.rotate(
      angle: -math.pi / 2.0,
      child: Image.memory(
        editImage!,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  void reset_edit_image() {
    editImage = null;
    notifyListeners();
  }

  bool is_edit_image_null() {
    if (editImage == null) {
      return true;
    } else {
      return false;
    }
  }

  String? imgPath;
  set set_image_path(String value) {
    imgPath = value;
    notifyListeners();
  }

  void set_imgpath(String path) {
    imgPath = path;
    notifyListeners();
  }

  String? get get_image_path => imgPath;

  void removeImage() {
    _picked_image = null;
    notifyListeners();
  }

  bool isImageNull() {
    if (_picked_image == null) {
      return true;
    } else {
      return false;
    }
  }

  Image getImage() {
    return _picked_image!;
  }

  Future<Uint8List?> imageToUint8List(File? image) async {
    if (image == null) {
      return null;
    }
    Future<Uint8List> imageRaw = image.readAsBytes();

    return imageRaw;
  }

  Uint8List getUint8List() {
    return editImage!;
  }

  double img_count = 6;
  double get get_img_count => img_count;
  set_img_count(double value) {
    img_count = value;
    notifyListeners();
  }

  void reset_all() {
    removeImage();
    reset_edit_image();
    notifyListeners();
  }

  bool isSaving = false;
  void set_isSaving(bool value) {
    isSaving = value;
    notifyListeners();
  }

  bool get get_isSaving => isSaving;
  bool isSaving2 = false;
  void set_isSaving2(bool value) {
    isSaving2 = value;
    notifyListeners();
  }

  bool get get_isSaving2 => isSaving2;
}
