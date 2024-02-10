import 'package:flutter/material.dart';

import '../pages/core/bottom_navbar/bottom_navbar.dart';
import 'theme.dart' as theme;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: theme.light,
      home: const BottomNavbar(),
    );
  }
}
