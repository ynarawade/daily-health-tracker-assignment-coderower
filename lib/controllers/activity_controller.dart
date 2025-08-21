import 'dart:developer';

import 'package:daily_health_tracker/services/acitvity.dart';
import 'package:get/get.dart';
import '../models/activity_model.dart';

class ActivityController extends GetxController {
  var activities = <Activity>[].obs;
  var isLoading = false.obs;
  var page = 0;
  final int limit = 10;
  var hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchActivities();
  }

  void fetchActivities() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;

    try {
      final newActivities = await ActivityService.fetchPosts(
        start: page * limit,
        limit: limit,
      );

      if (newActivities.isEmpty) {
        hasMore.value = false;
      } else {
        activities.addAll(newActivities);
        page++;
      }
    } catch (e,st) {
      log(st.toString());
      log(e.toString());
      // Get.snackbar("Error", "Failed to fetch activities: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
