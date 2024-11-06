import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:movie_app/store/movie_state.dart';
import 'package:movie_app/store/movie_store.dart';
import 'package:movie_app/widgets/movie_carousel.dart';
import 'package:movie_app/widgets/popular_movie_carousel.dart';

class MovieStoreBuilder extends StatefulWidget {
  final MovieStore store;
  final bool isCarousel;
  final String? title;
  final CategoryType type;

  const MovieStoreBuilder({
    super.key,
    required this.store,
    required this.isCarousel,
    required this.type,
    this.title,
  });

  @override
  State<MovieStoreBuilder> createState() => _MovieStoreBuilderState();
}

class _MovieStoreBuilderState extends State<MovieStoreBuilder> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.store,
      builder: (context, movieState, child) {
        if (movieState is MovieStateLoading && widget.isCarousel) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: LinearProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
        if (movieState is MovieStateSuccess) {
          if (widget.isCarousel) {
            return PopularMovieCarousel(movies: movieState.movies);
          } else {
            return MovieCarousel.large(
              movies: movieState.movies,
              type: widget.type,
              title: widget.title ?? "",
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
