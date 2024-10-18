import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_gradients.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.primaryGradient,
      ),
    );
  }
}
