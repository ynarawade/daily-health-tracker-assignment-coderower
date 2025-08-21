import 'dart:async';
import 'package:daily_health_tracker/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/toast.dart';





class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

final clientId = dotenv.env['GOOGLE_CLIENT_ID'];
final serverClientId = dotenv.env['GOOGLE_SERVER_CLIENT_ID'];

  var isSignedIn = false.obs;
  var userName = "".obs;
  var userEmail = "".obs;
  var userPhoto = "".obs;

  StreamSubscription<GoogleSignInAuthenticationEvent>? _authSubscription;

  @override
  void onInit() {
    super.onInit();
    _initGoogleSignIn();
  }

  void _initGoogleSignIn() async {
    await _googleSignIn.initialize(
      clientId:clientId,
      serverClientId:serverClientId,
    );

    // Listen to authentication events
    _authSubscription = _googleSignIn.authenticationEvents.listen(
      _handleAuthEvent,
    );

    // Try lightweight auto-sign in
    _googleSignIn.attemptLightweightAuthentication();
  }

  void _handleAuthEvent(GoogleSignInAuthenticationEvent event) {
    if (event is GoogleSignInAuthenticationEventSignIn) {
      final user = event.user;
      isSignedIn.value = true;
      userName.value = user.displayName ?? "";
      userEmail.value = user.email;
      userPhoto.value = user.photoUrl ?? "";
      ToastUtil.success("Welcome, ${user.displayName ?? 'User'}!");

      Get.offAllNamed(AppRoutes.home);
    } else if (event is GoogleSignInAuthenticationEventSignOut) {
      _clearUser();
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future<void> signIn() async {
    try {
      if (_googleSignIn.supportsAuthenticate()) {
        await _googleSignIn.authenticate();
      } else {
        ToastUtil.warning("Sign-in not supported on this platform.");
      }
    } on GoogleSignInException catch (e) {
      // Only show a toast for real errors, not cancellation
      if (e.code == GoogleSignInExceptionCode.clientConfigurationError) {
        ToastUtil.error("Google Sign-In is not configured correctly.");
      }
      // ignore cancellation
    } catch (e) {
      ToastUtil.error("Sign-in failed. Please try again.");
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    _clearUser();
    Get.offAllNamed(AppRoutes.login);
  }

  void _clearUser() {
    isSignedIn.value = false;
    userName.value = "";
    userEmail.value = "";
    userPhoto.value = "";
  }

  @override
  void onClose() {
    _authSubscription?.cancel();
    super.onClose();
  }
}
