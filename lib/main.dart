// lib/main.dart

import 'package:flutter/material.dart';
import 'splash_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi UTS Mobile', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink, 
        scaffoldBackgroundColor: const Color(0xFFFFF0F5), 
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF48FB1), 
          foregroundColor: Colors.white, 
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFE91E63), 
          unselectedItemColor: Color(0xFFC4C4C4), 
          backgroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF48FB1), 
            foregroundColor: Colors.white, 
          ),
        ),
      ),
      home: const SplashScreen(), 
    );
  }
}