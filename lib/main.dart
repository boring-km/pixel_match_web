import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_match_web/di/setup.dart';
import 'package:pixel_match_web/presentation/play/play_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pixel Matching Game',
      debugShowCheckedModeBanner: false,
      initialRoute: '/play',
      getPages: [
        GetPage(name: '/play', page: () => const PlayView(), binding: PlayViewBinding()),
      ],
    );
  }
}
