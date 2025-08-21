import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class WalkCountdownTimer extends StatefulWidget {
  const WalkCountdownTimer({super.key});

  @override
  State<WalkCountdownTimer> createState() => _WalkCountdownTimerState();
}

class _WalkCountdownTimerState extends State<WalkCountdownTimer> {
  Timer? _timer;
  DateTime? _nextWalkTime;
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_nextWalkTime == null) return; // skip if no time set
      final now = DateTime.now();
      final difference = _nextWalkTime!.difference(now);
      if (mounted) {
        setState(() {
          _timeLeft = difference.isNegative ? Duration.zero : difference;
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  Future<void> _pickNextWalkTime() async {
    final now = DateTime.now();
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final chosenDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      setState(() {
        // if the picked time is before now, schedule for tomorrow
        _nextWalkTime = chosenDateTime.isBefore(now)
            ? chosenDateTime.add(const Duration(days: 1))
            : chosenDateTime;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? AppColors.darkSurface
        : AppColors.lightSurface;
    final textColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Next Walk Reminder",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _nextWalkTime == null ? "--:--:--" : _formatDuration(_timeLeft),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _pickNextWalkTime,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlueDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Set Next Walk Time",
              style: TextStyle(color: AppColors.darkTextPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
