import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xBFAB947B),
      ),
      child: const Icon(
        Icons.notifications,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
