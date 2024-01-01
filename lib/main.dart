import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:us_photo_id/provider/image_provider.dart';
import 'package:us_photo_id/screen/about_screen.dart';
import 'package:us_photo_id/screen/howtouse_screen.dart';
import 'package:provider/provider.dart';
import 'screen/home_screen.dart';
import 'screen/pp_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhotoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PhotoProvider photoProvider = Provider.of<PhotoProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${photoProvider.selectedCountry} Photo ID',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/test': (context) => const pp(),
        '/about': (context) => Aboutpage(),
        '/howtouse': (context) => const HowToUse(),
      },
    );
  }
}
