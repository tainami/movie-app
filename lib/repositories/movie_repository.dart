import 'package:dio/dio.dart';
import 'package:movie_app/core/app_error.dart';
import 'package:movie_app/models/movie_model.dart';

abstract class MovieRepository {
  Future<(List<MovieModel>?, AppError?)> getMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  final Dio dio;

  MovieRepositoryImpl(this.dio);

  @override
  Future<(List<MovieModel>?, AppError?)> getMovies() async {
    try {
      final response = await dio.get(
        "https://jsonplaceholder.typicode.com/users",
      );
      final data = response.data as List;
      final List<MovieModel> movies = data.map((u) {
        return MovieModel.fromMap(u);
      }).toList();
      return (movies, null);
    } on DioException {
      return (
        null,
        UnknownError("Erro desconhecido"),
      );
    }
  }
}
