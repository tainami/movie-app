import 'package:dio/dio.dart';
import 'package:movie_app/core/app_error.dart';
import 'package:movie_app/core/constants/app_token.dart';
import 'package:movie_app/models/list_credits_model.dart';
import 'package:movie_app/models/list_movie_model.dart';
import 'package:movie_app/models/movie_model.dart';

abstract class MovieRepository {
  Future<(List<ListMovieModel>?, AppError?)> getPopularMovies({
    bool takeFive = false,
    required int page,
  });
  Future<(List<ListMovieModel>?, AppError?)> getNowPlayingMovies({
    bool takeFive = false,
    required int page,
  });
  Future<(List<ListMovieModel>?, AppError?)> getTopRatedMovies({
    bool takeFive = false,
    required int page,
  });
  Future<(MovieModel?, AppError?)> getMovieById(int id);
  Future<(List<ListCreditsModel>?, AppError?)> getMovieCast(int movieId);
  Future<(List<ListMovieModel>?, AppError?)> searchMovies(String query);
}

class MovieRepositoryImpl implements MovieRepository {
  final Dio dio;

  MovieRepositoryImpl(this.dio);

  @override
  Future<(List<ListMovieModel>?, AppError?)> getPopularMovies({
    bool takeFive = false,
    required int page,
  }) async {
    return await _fetchMovies(
      "https://api.themoviedb.org/3/movie/popular?language=en-US&page=$page",
      takeFive: takeFive,
    );
  }

  @override
  Future<(List<ListMovieModel>?, AppError?)> getNowPlayingMovies({
    bool takeFive = false,
    required int page,
  }) async {
    return await _fetchMovies(
      "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=$page",
      takeFive: takeFive,
    );
  }

  @override
  Future<(List<ListMovieModel>?, AppError?)> getTopRatedMovies({
    bool takeFive = false,
    required int page,
  }) async {
    return await _fetchMovies(
      "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=$page",
      takeFive: takeFive,
    );
  }

  Future<(List<ListMovieModel>?, AppError?)> _fetchMovies(String url,
      {bool takeFive = false}) async {
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
          data.map((u) => ListMovieModel.fromMap(u)).toList();

      return (takeFive ? movies.take(5).toList() : movies, null);
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

  @override
  Future<(List<ListCreditsModel>?, AppError?)> getMovieCast(int movieId) async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/$movieId/credits?language=en-US",
        options: Options(headers: <String, dynamic>{
          'Authorization': 'Bearer ${AppToken.token}',
          'content-type': 'application/json',
        }),
      );

      final data = response.data["cast"] as List;
      final List<ListCreditsModel> castMovie =
          data.map((u) => ListCreditsModel.fromMap(u)).toList();
      return (castMovie, null);
    } on DioException {
      return (
        null,
        UnknownError("Erro desconhecido"),
      );
    }
  }

  @override
  Future<(List<ListMovieModel>?, AppError?)> searchMovies(String query) async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&language=en-US&page=1",
        options: Options(headers: <String, dynamic>{
          'Authorization': 'Bearer ${AppToken.token}',
          'content-type': 'application/json',
        }),
      );

      final data = response.data["results"] as List;
      final List<ListMovieModel> movies =
          data.map((u) => ListMovieModel.fromMap(u)).toList();
      return (movies, null);
    } on DioException {
      return (
        null,
        UnknownError("Erro ao buscar filmes"),
      );
    }
  }
}
