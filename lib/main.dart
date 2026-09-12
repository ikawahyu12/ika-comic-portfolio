import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const IkaPortfolioApp());
}

class IkaPortfolioApp extends StatelessWidget {
  const IkaPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IKA.EXE',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.red),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
