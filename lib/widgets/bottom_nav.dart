import 'package:daily_health_tracker/views/ActivityLogs/activity_logs.dart';
import 'package:daily_health_tracker/views/Stats/stats_page.dart';
import 'package:daily_health_tracker/views/Home/home.dart';
import 'package:daily_health_tracker/utils/colors.dart';
import 'package:daily_health_tracker/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomNavController _controller = Get.put(BottomNavController());

  final List<Widget> _pages = [HomePage(), ActivityLogsPage(), StatsPage()];

  final List<String> _titles = ["Home", "Activity Logs", "Stats"];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CommonAppBar(title: _titles[_controller.selectedIndex.value]),
        body: _pages[_controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _controller.selectedIndex.value,
          onTap: (index) => _controller.changePage(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Logs'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Stats',
            ),
          ],
        ),
      ),
    );
  }
}
