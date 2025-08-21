import 'package:daily_health_tracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_health_tracker/controllers/auth_controller.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return AppBar(
      elevation: 4, // subtle shadow
      backgroundColor: Get.isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      titleSpacing: 16,
      centerTitle: false,

      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.headlineMedium?.color,
        ),
      ),
      actions: [
        // Theme toggle button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Builder(
            builder: (context) {
              final isDark = Theme.of(context).brightness == Brightness.dark;
              return Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.white12 : Colors.black12,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    isDark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    size: 22,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    Get.changeThemeMode(
                      isDark ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                  tooltip: isDark
                      ? 'Switch to Light Mode'
                      : 'Switch to Dark Mode',
                ),
              );
            },
          ),
        ),
        // Logout button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: authController.signOut,
              icon: const Icon(Icons.logout, color: Colors.red),
              tooltip: 'Logout',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}
