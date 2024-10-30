import 'package:dio/dio.dart';
import 'package:movie_app/core/app_error.dart';
import 'package:movie_app/core/constants/app_token.dart';
import 'package:movie_app/models/list_movie_model.dart';
import 'package:movie_app/models/movie_model.dart';

abstract class MovieRepository {
  Future<(List<ListMovieModel>?, AppError?)> getPopularMovies();
  Future<(List<ListMovieModel>?, AppError?)> getNowPlayingMovies();
  Future<(List<ListMovieModel>?, AppError?)> getTopRatedMovies();
  Future<(MovieModel?, AppError?)> getMovieById(int id);
}

class MovieRepositoryImpl implements MovieRepository {
  final Dio dio;

  MovieRepositoryImpl(this.dio);

  @override
  Future<(List<ListMovieModel>?, AppError?)> getPopularMovies() async {
    return await _fetchMovies(
        "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1");
  }

  @override
  Future<(List<ListMovieModel>?, AppError?)> getNowPlayingMovies() async {
    return await _fetchMovies(
        "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1");
  }

  @override
  Future<(List<ListMovieModel>?, AppError?)> getTopRatedMovies() async {
    return await _fetchMovies(
        "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1");
  }

  Future<(List<ListMovieModel>?, AppError?)> _fetchMovies(String url) async {
    try {
      final response = await dio.get(
        url,
        options: Options(headers: <String, dynamic>{
          'Authorization': 'Bearer ${AppToken.token}',
          'content-type': 'application/json',
        }),
      );

      final data = response.data["results"] as List;
      final List<ListMovieModel> movies =
          data.map((u) => ListMovieModel.fromMap(u)).take(5).toList();
      return (movies, null);
    } on DioException {
      return (
        null,
        UnknownError("Erro desconhecido"),
      );
    }
  }

  @override
  Future<(MovieModel?, AppError?)> getMovieById(int id) async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/$id?language=en-US",
        options: Options(headers: <String, dynamic>{
          'Authorization': 'Bearer ${AppToken.token}',
          'content-type': 'application/json',
        }),
      );
      final movie = MovieModel.fromMap(response.data);
      return (movie, null);
    } on DioException {
      return (
        null,
        UnknownError("Erro desconhecido"),
      );
    }
  }
}
