import 'package:flutter/material.dart';

import 'screens/main_shell.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: appDarkMode,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'IKA.EXE Portfolio',
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'ComicNeue',
            scaffoldBackgroundColor: AppColors.cream,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.red,
              brightness: Brightness.light,
            ),
            textTheme: ThemeData.light().textTheme.apply(
              bodyColor: AppColors.outline,
              displayColor: AppColors.outline,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.yellow,
              foregroundColor: AppColors.outline,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: AppColors.outline),
              hintStyle: TextStyle(color: Color(0xFF5B5B5B)),
              prefixIconColor: AppColors.outline,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.outline, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.outline, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 3),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 2),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.outline,
                backgroundColor: AppColors.yellow,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: AppColors.outline, width: 2),
                ),
              ),
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'ComicNeue',
            scaffoldBackgroundColor: AppColors.darkBackground,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.red,
              brightness: Brightness.dark,
              surface: AppColors.darkSurface,
              onSurface: const Color(0xFFFFF8E7),
              onPrimary: AppColors.paper,
            ),
            textTheme: ThemeData.dark().textTheme.apply(
              bodyColor: const Color(0xFFFFF8E7),
              displayColor: const Color(0xFFFFF8E7),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.darkSurface,
              foregroundColor: Color(0xFFFFF8E7),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Color(0xFFD1D7E0)),
              hintStyle: TextStyle(color: Color(0xFFADB8C8)),
              prefixIconColor: Color(0xFFD1D7E0),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD1D7E0), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD1D7E0), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.yellow, width: 3),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 2),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.paper,
                backgroundColor: AppColors.darkRed,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: AppColors.darkOutline, width: 2),
                ),
              ),
            ),
            dialogTheme: const DialogThemeData(
              backgroundColor: AppColors.darkSurface,
              titleTextStyle: TextStyle(
                color: Color(0xFFFFF8E7),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              contentTextStyle: TextStyle(color: Color(0xFFD1D7E0)),
            ),
            snackBarTheme: const SnackBarThemeData(
              backgroundColor: AppColors.darkSurface,
              contentTextStyle: TextStyle(color: Color(0xFFFFF8E7)),
            ),
            useMaterial3: true,
          ),
          home: const MainShell(),
        );
      },
    );
  }
}
