import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/LocaleString.dart';
import 'package:internship/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      title: 'Flutter Shop',
      home: const SplashScreen(),
    );
  }
}
