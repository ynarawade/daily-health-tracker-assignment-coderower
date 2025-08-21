import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/activity_controller.dart';
import '../../widgets/activity_card.dart';

class ActivityLogsPage extends StatelessWidget {
  ActivityLogsPage({super.key});

  final ScrollController _scrollController = ScrollController();

  final ActivityController _controller = Get.put(ActivityController());
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_controller.isLoading.value) {
        _controller.fetchActivities();
      }
    });

    return Scaffold(
      body: Obx(() {
        if (_controller.activities.isEmpty && _controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount: _controller.activities.length + 1,
          itemBuilder: (context, index) {
            if (index < _controller.activities.length) {
              final activity = _controller.activities[index];
              return ActivityCard(activity: activity, index: index);
            } else {
              return _controller.hasMore.value
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox.shrink();
            }
          },
        );
      }),
    );
  }
}
