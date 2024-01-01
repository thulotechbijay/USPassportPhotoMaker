// import 'package:flutter/material.dart';
// import 'package:image_editor_plus/image_editor_plus.dart';
// import 'package:image_editor_plus/utils.dart';
// import 'package:provider/provider.dart';

// import '../provider/image_provider.dart';

// class CropPage extends StatefulWidget {
//   const CropPage({super.key});

//   @override
//   State<CropPage> createState() => _CropPageState();
// }

// class _CropPageState extends State<CropPage> {
//   @override
//   Widget build(BuildContext context) {
//     final PhotoProvider photoProvider = Provider.of<PhotoProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Crop Image'),
//       ),
//       body: ImageCropper(
//         image: photoProvider.getUint8List(),
//         availableRatios: const [AspectRatioOption(title: "US", ratio: 2 / 2)],
//       ),
//     );
//   }
// }
