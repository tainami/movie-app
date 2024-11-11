import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/models/list_movie_model.dart';
import 'package:movie_app/widgets/gradient_background.dart';
import 'package:movie_app/widgets/movie_card.dart';

class ListMovieGrid extends StatelessWidget {
  final ScrollController scrollController;
  final List<ListMovieModel> movies;
  final bool isLoading;

  const ListMovieGrid({
    super.key,
    required this.scrollController,
    required this.movies,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackground(),
        Column(
          children: [
            SizedBox(
              height: context.percentHeight(0.15),
            ),
            Expanded(
              child: GridView.builder(
                controller: scrollController,
                padding: const EdgeInsets.only(
                  bottom: 32.0 + kBottomNavigationBarHeight,
                  top: 16.0,
                  left: 16,
                  right: 16,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 9 / 12,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieCard.mini(
                    url: movies[index].imageUrl,
                    id: movies[index].id,
                    useRightSpacing: false,
                    useNavigation: true,
                  );
                },
              ),
            ),
            if (isLoading) ...{
              const LinearProgressIndicator(
                color: AppColors.primary,
              ),
            }
          ],
        ),
      ],
    );
  }
}
