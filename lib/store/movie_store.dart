import 'package:flutter/material.dart';
import 'package:movie_app/core/app_error.dart';
import 'package:movie_app/models/list_credits_model.dart';
import 'package:movie_app/models/list_movie_model.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/store/movie_state.dart';

enum FetchType {
  popular,
  recent,
  topRated,
}

class MovieStore extends ValueNotifier<MovieState> {
  final MovieRepository repository;

  MovieStore(this.repository) : super(MovieStateInitials());

  Future<void> getPopularMovies() async {
    await fetchMovies(FetchType.popular);
  }

  Future<void> getNowPlayingMovies() async {
    await fetchMovies(FetchType.recent);
  }

  Future<void> getTopRatedMovies() async {
    await fetchMovies(FetchType.topRated);
  }

  Future<void> fetchMovies(FetchType fetchType) async {
    value = MovieStateLoading();

    (List<ListMovieModel>?, AppError?) movies;

    switch (fetchType) {
      case FetchType.popular:
        movies = await repository.getPopularMovies();
        break;
      case FetchType.topRated:
        movies = await repository.getTopRatedMovies();
        break;
      case FetchType.recent:
        movies = await repository.getNowPlayingMovies();
        break;
    }

    if (movies.$1 != null) {
      value = MovieStateSuccess(movies: movies.$1!);
    } else if (movies.$2 != null) {
      final errorMessage = movies.$2!.message;
      value = MovieStateError(errorMessage);
    }
  }

  Future<void> fetchMovieById(int id) async {
    value = MovieStateLoading();

    final movies = await repository.getMovieById(id);

    if (movies.$1 != null) {
      value = MovieStateSingleSuccess(movie: movies.$1!);
    } else if (movies.$2 != null) {
      final errorMessage = movies.$2!.message;
      value = MovieStateError(errorMessage);
    }
  }

  Future<void> fetchMovieCast(int movieId) async {
    value = MovieStateLoading();

    (List<ListCreditsModel>?, AppError?) movieCast;

    movieCast = await repository.getMovieCast(movieId);

    if (movieCast.$1 != null) {
      value = MovieCastStateSuccess(movieCast: movieCast.$1!);
    } else if (movieCast.$2 != null) {
      final errorMessage = movieCast.$2!.message;
      value = MovieStateError(errorMessage);
    }
  }

  Future<void> searchMovies(String query) async {
    value = MovieStateLoading();
    final response = await repository.searchMovies(query);
    if (response.$1 != null) {
      final moviesWithPosters =
          response.$1!.where((movie) => movie.poster_path != null).toList();
      value = MovieStateSuccess(movies: moviesWithPosters);
    } else {
      value = MovieStateError(response.$2?.message ?? 'Erro ao buscar filmes');
    }
  }
}
