import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/models/list_movie_model.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:movie_app/widgets/movie_card.dart';

class MovieCarousel extends StatelessWidget {
  final List<ListMovieModel> movies;
  final String title;
  final String size;
  final CategoryType type;

  const MovieCarousel.large({
    super.key,
    required this.movies,
    required this.title,
    required this.type,
    this.size = "large",
  });

  const MovieCarousel.mini({
    super.key,
    required this.movies,
    required this.title,
    required this.type,
    this.size = "mini",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.bodyLarge,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/movie-list",
                    arguments: MovieListScreenArgs(title: title, type: type),
                  );
                },
                child: Text(
                  "See all",
                  style: context.bodyLarge.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Spacing.m10,
          ),
          SizedBox(
            height: size == "large"
                ? MovieCardContraints.movieCardHeightLarge
                : MovieCardContraints.movieCardHeightMini,
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
              ) {
                return Container(
                  child: size == "large"
                      ? MovieCard.large(
                          url: movies[itemIndex].imageUrl,
                          id: movies[itemIndex].id,
                        )
                      : MovieCard.mini(
                          url: movies[itemIndex].imageUrl,
                          id: movies[itemIndex].id,
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
