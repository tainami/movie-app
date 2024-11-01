import 'dart:convert';

class ListCreditsModel {
  final int id;
  final String name;
  final String character;
  final String known_for_department;
  final String? profile_path;

  ListCreditsModel({
    required this.id,
    required this.name,
    required this.character,
    required this.known_for_department,
    required this.profile_path,
  });

  String get imageUrl {
    if (profile_path == null) {
      return '';
    }
    return "https://image.tmdb.org/t/p/w342$profile_path";
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'character': character,
      'known_for_department': known_for_department,
      'profile_path': profile_path,
    };
  }

  factory ListCreditsModel.fromMap(Map<String, dynamic> map) {
    return ListCreditsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      character: map['character'] as String,
      known_for_department: map['known_for_department'] as String,
      profile_path: map['profile_path'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListCreditsModel.fromJson(String source) =>
      ListCreditsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
