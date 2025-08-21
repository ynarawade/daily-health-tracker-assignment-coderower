import 'package:get/get.dart';
import '../controllers/activity_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Lazy initialize ActivityController only when it's needed
    Get.lazyPut<ActivityController>(() => ActivityController());
  }
}
