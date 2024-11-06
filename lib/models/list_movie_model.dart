import 'dart:convert';

import 'package:equatable/equatable.dart';

class ListMovieModel extends Equatable {
  final int id;
  final String? backdrop_path;
  final List<num> genre_ids;
  final String overview;
  final double popularity;
  final String? poster_path;
  final String release_date;
  final String title;
  final double vote_average;
  final num vote_count;

  const ListMovieModel({
    required this.id,
    required this.backdrop_path,
    required this.genre_ids,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });

  String get imageUrl {
    if (poster_path == null) {
      return 'https://www.shutterstock.com/image-vector/image-icon-600nw-211642900.jpg';
    }
    return "https://image.tmdb.org/t/p/w342$poster_path";
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'backdrop_path': backdrop_path,
      'genre_ids': genre_ids,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path,
      'release_date': release_date,
      'title': title,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  factory ListMovieModel.fromMap(Map<String, dynamic> map) {
    final data = ListMovieModel(
      id: map['id'] as int,
      backdrop_path: map['backdrop_path'] as String?,
      genre_ids: List<num>.from(
        (map['genre_ids'] as List),
      ),
      overview: map['overview'] as String,
      popularity: map['popularity'] as double,
      poster_path: map['poster_path'] as String?,
      release_date: map['release_date'] as String,
      title: map['title'] as String,
      vote_average: map['vote_average'] as double,
      vote_count: map['vote_count'] as num,
    );
    return data;
  }

  String toJson() => json.encode(toMap());

  factory ListMovieModel.fromJson(String source) =>
      ListMovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id,
        backdrop_path,
        genre_ids,
        overview,
        popularity,
        poster_path,
        release_date,
        title,
        vote_average,
        vote_count,
      ];
}
