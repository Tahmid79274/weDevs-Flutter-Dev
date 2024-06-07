import 'package:flutter/material.dart';
import './splash_screen.dart';
import 'utils/color/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'we_devs_flutter_assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.carnation),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}