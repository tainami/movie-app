// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/store/movie_state.dart';

class MovieStore extends ValueNotifier<MovieState> {
  final MovieRepository repository;

  MovieStore(
    this.repository,
  ) : super(MovieStateInitials());

  Future<void> getPopularMovies() async {
    value = MovieStateLoading();
    final movies = await repository.getPopularMovies();

    if (movies.$1 != null) {
      value = MovieStateSuccess(movies: movies.$1!);
    } else if (movies.$2 != null) {
      final errorMessage = movies.$2!.message;

      value = MovieStateError(errorMessage);
    }
  }
}
