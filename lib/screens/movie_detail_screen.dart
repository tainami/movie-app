import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/store/movie_state.dart';
import 'package:movie_app/store/movie_store.dart';
import 'package:movie_app/widgets/movie_detail_content.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late final MovieStore store;

  @override
  void initState() {
    super.initState();
    store = MovieStore(MovieRepositoryImpl(Dio()));

    store.fetchMovieById(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (context, movieState, child) {
          if (movieState is MovieStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (movieState is MovieStateError) {
            return Center(
              child: Text(movieState.message ?? 'Erro desconhecido'),
            );
          } else if (movieState is MovieStateSingleSuccess) {
            return MovieDetailContent(
              movie: movieState.movie,
              movieId: movieState.movie.id,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
