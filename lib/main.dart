import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode:ThemeMode.light ,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
