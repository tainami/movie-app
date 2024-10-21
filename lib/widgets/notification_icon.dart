import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primary,
      ),
      child: const Icon(
        Icons.notifications,
        color: AppColors.light,
        size: 20,
      ),
    );
  }
}
