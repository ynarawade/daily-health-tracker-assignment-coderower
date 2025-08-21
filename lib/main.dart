import 'package:daily_health_tracker/app.dart';
import 'package:daily_health_tracker/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env"); // load all env variables
  Get.put(AuthController());

  runApp(MyApp());
}
