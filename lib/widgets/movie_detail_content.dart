import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/widgets/cast_list_builder.dart';
import 'package:movie_app/widgets/movie_detail_background.dart';
import 'package:movie_app/widgets/movie_tags.dart';
import 'package:share_plus/share_plus.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieModel movie;
  final int movieId;

  const MovieDetailContent({
    super.key,
    required this.movie,
    required this.movieId,
  });

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
                  color: AppColors.primary.withOpacity(0.6),
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
                    color: AppColors.primary.withOpacity(0.6),
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
              top: context.percentHeight(0.4),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(
                      child: Text(
                        movie.vote_average.toStringAsFixed(1),
                        style: context.bodyLarge,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      child: Text(
                        '(${movie.vote_count})',
                        style: context.bodyLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                MovieTags(
                  tags: movie.genres.map((genre) => genre.name).toList(),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      movie.overview,
                      style: context.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "The Cast",
                            style: context.bodyMedium,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See all",
                              style: context.bodyLarge.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CastListBuilder(movieId: movieId),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
