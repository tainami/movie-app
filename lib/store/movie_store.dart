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
  int page = 1;
  List<ListMovieModel> _currentMovies = [];

  MovieStore(this.repository) : super(MovieStateInitials());

  Future<void> getPopularMovies({bool takeFive = false}) async {
    await fetchMovies(FetchType.popular, takeFive: takeFive);
  }

  Future<void> getNowPlayingMovies({bool takeFive = false}) async {
    await fetchMovies(FetchType.recent, takeFive: takeFive);
  }

  Future<void> getTopRatedMovies({bool takeFive = false}) async {
    await fetchMovies(FetchType.topRated, takeFive: takeFive);
  }

  Future<void> fetchMovies(FetchType fetchType, {bool takeFive = false}) async {
    value = MovieStateLoading();

    (List<ListMovieModel>?, AppError?) movies;

    switch (fetchType) {
      case FetchType.popular:
        movies = await repository.getPopularMovies(
          takeFive: takeFive,
          page: page,
        );
        break;
      case FetchType.topRated:
        movies = await repository.getTopRatedMovies(
          takeFive: takeFive,
          page: page,
        );
        break;
      case FetchType.recent:
        movies = await repository.getNowPlayingMovies(
          takeFive: takeFive,
          page: page,
        );
        break;
    }

    if (movies.$1 != null) {
      _currentMovies = [..._currentMovies, ...movies.$1!];
      value = MovieStateSuccess(
        movies: _currentMovies.toSet().toList(),
      );
      page++;
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
      final actorWithImage = movieCast.$1!
          .where((movie) =>
              movie.profile_path != null &&
              movie.known_for_department == "Acting")
          .toList();
      value = MovieCastStateSuccess(movieCast: actorWithImage);
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

  void resetState() {
    value = MovieStateInitials();
  }
}
