import 'package:movie_app/models/movie_model.dart';

class MovieState {}

class MovieStateLoading extends MovieState {}

class MovieStateSuccess extends MovieState {
  final List<MovieModel> movies;

  MovieStateSuccess({required this.movies});
}

class MovieStateError extends MovieState {
  final String? message;
  MovieStateError(this.message);
}

class MovieStateInitials extends MovieState {}
