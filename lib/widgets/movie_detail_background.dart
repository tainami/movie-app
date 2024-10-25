import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_gradients.dart';

class MovieDetailBackground extends StatelessWidget {
  final String imageUrl;
  final double gradientHeightFactor;

  const MovieDetailBackground({
    super.key,
    required this.imageUrl,
    this.gradientHeightFactor = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * gradientHeightFactor,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: AppGradients.darkGradient,
            ),
          ),
        ),
      ],
    );
  }
}
