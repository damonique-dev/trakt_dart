import 'package:json_annotation/json_annotation.dart';
import 'package:trakt_dart/models/common_models.dart';

part 'people_models.g.dart';

@JsonSerializable(createToJson: false)
class Person {
  // Extended: metadata (minimum data provided)
  final String name;
  final Ids ids;

  // Extended: full
  final String? biography, birthday, death, birthplace, homepage;
  @JsonKey(name: 'social_ids')
  final SocialIds? socialIds;

  Person(this.name, this.ids, this.biography, this.birthday, this.death, this.birthplace, this.homepage, this.socialIds);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  static Person fromJsonModel(Map<String, dynamic> json) => Person.fromJson(json);
}

@JsonSerializable(createToJson: false)
class SocialIds {
  final String? twitter, facebook, instagram, wikipedia;

  SocialIds(this.twitter, this.facebook, this.instagram, this.wikipedia);

  factory SocialIds.fromJson(Map<String, dynamic> json) => _$SocialIdsFromJson(json);

  static SocialIds fromJsonModel(Map<String, dynamic> json) => SocialIds.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCharacter {
  final String character;
  final List<String> characters;
  final Person person;

  MovieCharacter(this.character, this.characters, this.person);

  factory MovieCharacter.fromJson(Map<String, dynamic> json) => _$MovieCharacterFromJson(json);

  static MovieCharacter fromJsonModel(Map<String, dynamic> json) => MovieCharacter.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCrew {
  final String job;
  final List<String> jobs;
  final Person person;

  MovieCrew(this.job, this.jobs, this.person);

  factory MovieCrew.fromJson(Map<String, dynamic> json) => _$MovieCrewFromJson(json);

  static MovieCrew fromJsonModel(Map<String, dynamic> json) => MovieCrew.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCharacter {
  final String character;
  final List<String> characters;
  final Person person;
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  ShowCharacter(this.character, this.characters, this.person, this.episodeCount);

  factory ShowCharacter.fromJson(Map<String, dynamic> json) => _$ShowCharacterFromJson(json);

  static ShowCharacter fromJsonModel(Map<String, dynamic> json) => ShowCharacter.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCrew {
  final String job;
  final List<String> jobs;
  final Person person;
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  ShowCrew(this.job, this.jobs, this.person, this.episodeCount);

  factory ShowCrew.fromJson(Map<String, dynamic> json) => _$ShowCrewFromJson(json);

  static ShowCrew fromJsonModel(Map<String, dynamic> json) => ShowCrew.fromJson(json);
}
