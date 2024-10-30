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

class MovieStateError extends MovieState {
  final String? message;
  MovieStateError(this.message);
}

class MovieStateInitials extends MovieState {}
