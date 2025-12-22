import 'package:flutter/material.dart';
import 'package:shop/core/style/repo.dart';

class AppStyle {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: StyleRepo.orange,
      scaffoldBackgroundColor: StyleRepo.white,
      appBarTheme: AppBarTheme(
        backgroundColor: StyleRepo.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        shadowColor: StyleRepo.darkedOrang,
        indicatorColor: StyleRepo.lightOrange2,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: StyleRepo.orange);
          }
          return IconThemeData(color: StyleRepo.darkGrey);
        }),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: StyleRepo.orange,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: StyleRepo.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: StyleRepo.orange),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: StyleRepo.orange, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: StyleRepo.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: StyleRepo.red, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: StyleRepo.orange,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
