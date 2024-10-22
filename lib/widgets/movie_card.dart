import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/spacing.dart';

class MovieCard extends StatelessWidget {
  final String url;
  final int id;
  final double height;
  final double width;

  const MovieCard.mini({
    super.key,
    this.height = 100,
    this.width = 100,
    required this.url,
    required this.id,
  });

  const MovieCard.large({
    super.key,
    this.height = 100,
    this.width = 140,
    required this.url,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: Spacing.x16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
