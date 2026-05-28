import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeveloperHub Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF818CF8),
          surface: Color(0xFF1E293B),
          error: Color(0xFFEF4444),
        ),
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Color(0xFF94A3B8),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xFF1E293B),
          contentTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
