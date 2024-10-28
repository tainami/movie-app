import 'package:dio/dio.dart';
import 'package:movie_app/core/app_error.dart';
import 'package:movie_app/core/constants/app_token.dart';
import 'package:movie_app/models/list_movie_model.dart';

abstract class MovieRepository {
  Future<(List<ListMovieModel>?, AppError?)> getPopularMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  final Dio dio;

  MovieRepositoryImpl(this.dio);

  @override
  Future<(List<ListMovieModel>?, AppError?)> getPopularMovies() async {
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1",
          options: Options(headers: <String, dynamic>{
            'Authorization': 'Bearer ${AppToken.token}',
            'content-type': 'application/json',
          }));
      final data = response.data["results"] as List;
      final List<ListMovieModel> movies = data
          .map((u) {
            return ListMovieModel.fromMap(u);
          })
          .take(5)
          .toList();
      return (movies, null);
    } on DioException {
      return (
        null,
        UnknownError("Erro desconhecido"),
      );
    }
  }
}
