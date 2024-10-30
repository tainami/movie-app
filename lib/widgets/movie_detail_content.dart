import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/widgets/movie_detail_background.dart';
import 'package:movie_app/widgets/movie_tags.dart';
import 'package:share_plus/share_plus.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovieDetailBackground(
          imageUrl: movie.imageUrl,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 40,
            leadingWidth: 56,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: Spacing.x16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.chevron_left,
                  color: AppColors.light,
                  size: 26,
                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Share.share(
                    movie.homepage,
                    subject: 'Recomendação de filme',
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: Spacing.x16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.share,
                    color: AppColors.light,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: context.percentHeight(0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    movie.title,
                    style: context.headlineLarge,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),
                MovieTags(
                  tags: movie.genres.map((genre) => genre.name).toList(),
                ),
                const SizedBox(height: 18),
                Text(
                  movie.overview,
                  style: context.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
