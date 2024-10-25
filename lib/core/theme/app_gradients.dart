import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF1C1B1B),
      Color(0xFF4B3D34),
    ],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xFFB68D4A),
      Color(0xffedd0a1),
    ],
  );

  static LinearGradient darkGradient = LinearGradient(
    colors: [
      const Color(0xFF1C1B1B),
      const Color(0xFF1C1B1B).withOpacity(0.9),
      const Color(0xFF1C1B1B).withOpacity(0.6),
      Colors.transparent,
    ],
    begin: const Alignment(0.0, 0.4),
    end: const Alignment(0.0, -0.8),
  );
}
