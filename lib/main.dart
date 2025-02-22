import 'package:flutter/material.dart';
import 'package:spliters/domain/app_theme/app_theme.dart';
import 'package:spliters/repository/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isLightTheme,
      darkTheme: isDarkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
