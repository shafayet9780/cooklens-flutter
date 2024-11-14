import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/pages/home/home_page.dart';

void main() {
  runApp(const CookLensApp());
}

class CookLensApp extends StatelessWidget {
  const CookLensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookLens',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}