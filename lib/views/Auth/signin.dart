import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (authController.isSignedIn.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(authController.userPhoto.value),
                ),
                const SizedBox(height: 16),
                Text(
                  authController.userName.value,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  authController.userEmail.value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: authController.signOut,
                  child: const Text("Sign Out"),
                ),
              ],
            );
          } else {
            return ElevatedButton.icon(
              onPressed: authController.signIn,
              icon: const Icon(Icons.login),
              label: const Text("Sign in with Google"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
