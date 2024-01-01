import 'dart:typed_data';
import 'package:flutter/material.dart';

class UploadButton extends StatefulWidget {
  const UploadButton({
    super.key,
    required this.media,
  });
  final Size media;
  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  Uint8List? imageData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: widget.media.height * 0.05,
          indent: 80,
          endIndent: 80,
          color: Colors.grey,
          thickness: 0.5,
        ),
        SizedBox(
          height: widget.media.height * 0.1,
        ),
      ],
    );
  }
}
