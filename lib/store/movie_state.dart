import 'package:movie_app/models/list_credits_model.dart';
import 'package:movie_app/models/list_movie_model.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieState {}

class MovieStateLoading extends MovieState {}

class MovieStateSuccess extends MovieState {
  final List<ListMovieModel> movies;

  MovieStateSuccess({required this.movies});
}

class MovieStateSingleSuccess extends MovieState {
  final MovieModel movie;

  MovieStateSingleSuccess({required this.movie});
}

class MovieCastStateSuccess extends MovieState {
  final List<ListCreditsModel> movieCast;

  MovieCastStateSuccess({required this.movieCast});
}

class MovieStateLoadingMore extends MovieState {
  final List<ListMovieModel> movies;

  MovieStateLoadingMore({required this.movies});
}

class MovieStateError extends MovieState {
  final List<ListMovieModel>? movies;
  final String? message;
  MovieStateError(this.message, {this.movies});
}

class MovieStateInitials extends MovieState {}
