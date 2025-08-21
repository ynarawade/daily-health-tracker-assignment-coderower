import 'package:daily_health_tracker/controllers/bottom_nav_controller.dart';
import 'package:daily_health_tracker/views/ActivityLogs/activity_logs.dart';
import 'package:daily_health_tracker/views/Home/home.dart';
import 'package:daily_health_tracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomNavController _controller = Get.put(BottomNavController());

  // Keep references to pages so state is preserved
  final RxList<Widget?> _pages = RxList<Widget?>.filled(2, null);

  Widget _buildPage(int index) {
    if (_pages[index] == null) {
      switch (index) {
        case 0:
          _pages[index] = HomePage();
          break;
        case 1:
          _pages[index] = ActivityLogsPage();
          break;
      }
    }
    return _pages[index]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Render all pages with Offstage to preserve state
        return Stack(
          children: List.generate(_pages.length, (index) {
            return Offstage(
              offstage: _controller.selectedIndex.value != index,
              child: _buildPage(index),
            );
          }),
        );
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _controller.selectedIndex.value,
          onTap: (index) => _controller.changePage(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Logs'),
          ],
        ),
      ),
    );
  }
}
