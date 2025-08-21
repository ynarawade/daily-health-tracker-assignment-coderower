import 'package:daily_health_tracker/views/Auth/signin.dart';
import 'package:daily_health_tracker/widgets/bottom_nav.dart';
import 'package:get/get.dart';
import 'app_routes.dart';



class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => SignInPage()),
    GetPage(name: AppRoutes.main, page: () => BottomNavScreen()),
  ];
}
