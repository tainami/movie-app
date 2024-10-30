import 'dart:convert';

import 'package:movie_app/models/genres_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieModel {
  final String backdrop_path;
  final List<GenresModel> genres;
  final int id;
  final String overview;
  final double popularity;
  final String poster_path;
  final String release_date;
  final String status;
  final String title;
  final String homepage;
  final double vote_average;
  final num vote_count;

  MovieModel({
    required this.backdrop_path,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.status,
    required this.title,
    required this.homepage,
    required this.vote_average,
    required this.vote_count,
    required this.genres,
  });

  String get imageUrl => "https://image.tmdb.org/t/p/w1280$poster_path";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrop_path': backdrop_path,
      'genres': genres.map((x) => x.toMap()).toList(),
      'id': id,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path,
      'release_date': release_date,
      'status': status,
      'title': title,
      'homepage': homepage,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      backdrop_path: map['backdrop_path'] as String,
      genres: List<GenresModel>.from(
        (map['genres'] as List<dynamic>).map<GenresModel>(
          (x) => GenresModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      id: map['id'] as int,
      overview: map['overview'] as String,
      popularity: map['popularity'] as double,
      poster_path: map['poster_path'] as String,
      release_date: map['release_date'] as String,
      status: map['status'] as String,
      title: map['title'] as String,
      homepage: map['homepage'] as String,
      vote_average: map['vote_average'] as double,
      vote_count: map['vote_count'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
