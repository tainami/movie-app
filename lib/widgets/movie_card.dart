import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';

class MovieCardContraints {
  static const double movieCardHeightMini = 120;
  static const double movieCardHeightLarge = 200;
}

class MovieCard extends StatelessWidget {
  final String url;
  final int id;
  final bool useRightSpacing;
  final double height;
  final double width;

  const MovieCard.mini({
    super.key,
    this.height = MovieCardContraints.movieCardHeightMini,
    this.width = 90,
    this.useRightSpacing = true,
    required this.url,
    required this.id,
  });

  const MovieCard.large({
    super.key,
    this.width = 140,
    this.height = MovieCardContraints.movieCardHeightLarge,
    this.useRightSpacing = true,
    required this.url,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(movieId: id),
          ),
        );
      },
      child: Container(
        width: width,
        margin:
            useRightSpacing ? const EdgeInsets.only(right: Spacing.x16) : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
