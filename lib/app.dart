import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_health_tracker/utils/theme.dart'; // <-- your AppTheme file

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Daily Health Tracker",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const Scaffold(body: Center(child: Text("Hello GetX"))),
    );
  }
}
