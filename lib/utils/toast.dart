import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastUtil {
  ToastUtil._();

  static void _show({
    required String message,
    IconData? icon,
    String? title,
    Color? backgroundColor,
  }) {
    Get.snackbar(
      '',
      '',
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.zero,
      borderRadius: 16,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      messageText: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? Color.fromRGBO(0, 0, 0, 0.85),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 12),
            ],
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void success(String message, {String? title}) {
    _show(
      message: message,
      title: title ?? 'Success',
      icon: Icons.check_circle_outline,
      backgroundColor: Color.fromRGBO(29, 165, 79, 0.847), // green
    );
  }

  static void error(String message, {String? title}) {
    _show(
      message: message,
      title: title ?? 'Error',
      icon: Icons.error_outline,
      backgroundColor: Color.fromRGBO(239, 68, 68, 0.85), // red
    );
  }

  static void warning(String message, {String? title}) {
    _show(
      message: message,
      title: title ?? 'Warning',
      icon: Icons.warning_amber_rounded,
      backgroundColor: Color.fromRGBO(249, 115, 22, 0.85), // orange
    );
  }

  static void info(String message, {String? title}) {
    _show(
      message: message,
      title: title ?? 'Info',
      icon: Icons.info_outline,
      backgroundColor: Color.fromRGBO(37, 99, 235, 0.85), // blue
    );
  }
}
