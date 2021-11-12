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
class Character {
  final String character;
  final List<String> characters;
  final Person person;

  Character(this.character, this.characters, this.person);

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  static Character fromJsonModel(Map<String, dynamic> json) => Character.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Crew {
  final String job;
  final List<String> jobs;
  final Person person;

  Crew(this.job, this.jobs, this.person);

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  static Crew fromJsonModel(Map<String, dynamic> json) => Crew.fromJson(json);
}
