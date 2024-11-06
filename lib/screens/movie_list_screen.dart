// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/store/movie_state.dart';
import 'package:movie_app/store/movie_store.dart';
import 'package:movie_app/widgets/gradient_background.dart';
import 'package:movie_app/widgets/movie_card.dart';

enum CategoryType {
  nowPlaying,
  topRated,
  popular,
}

class MovieListScreenArgs {
  final String title;
  final CategoryType type;

  MovieListScreenArgs({
    required this.title,
    required this.type,
  });
}

class MovieListScreen extends StatefulWidget {
  final MovieListScreenArgs? args;

  const MovieListScreen({
    super.key,
    this.args,
  });

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late final MovieStore store;

  @override
  void initState() {
    super.initState();
    store = MovieStore(MovieRepositoryImpl(Dio()));
    _fetchMoviesByCategory();
  }

  void _fetchMoviesByCategory() {
    switch (widget.args?.type) {
      case CategoryType.popular:
        store.getPopularMovies();
        break;
      case CategoryType.nowPlaying:
        store.getNowPlayingMovies();
        break;
      case CategoryType.topRated:
        store.getTopRatedMovies();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (context, state, child) {
          if (state is MovieStateLoading) {
            return const Stack(
              children: [
                GradientBackground(),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          } else if (state is MovieStateSuccess) {
            final movies = state.movies;
            return Stack(
              children: [
                const GradientBackground(),
                Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      title: Text(
                        widget.args?.title ?? "Movie List",
                        style: context.titleLarge.copyWith(
                          color: AppColors.light,
                        ),
                      ),
                      iconTheme: const IconThemeData(
                        color: AppColors.light,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(
                          bottom: 32.0 + kBottomNavigationBarHeight,
                          top: 16.0,
                          left: 16,
                          right: 16,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
