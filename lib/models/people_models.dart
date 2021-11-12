import 'package:json_annotation/json_annotation.dart';
import 'package:trakt_dart/models/common_models.dart';
import 'package:trakt_dart/models/movie_models.dart';
import 'package:trakt_dart/models/show_models.dart';

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
class MoviePeople {
  final List<MovieCharacter>? cast;
  final List<MovieCrew>? production, art, sound, writing, camera, directing, lighting, crew;

  @JsonKey(name: 'costume & make-up')
  final List<MovieCrew> costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<MovieCrew> visualEffects;

  MoviePeople(this.cast, this.production, this.art, this.sound, this.writing, this.camera, this.directing, this.lighting, this.crew, this.costumeAndMakeUp, this.visualEffects);

  factory MoviePeople.fromJson(Map<String, dynamic> json) => _$MoviePeopleFromJson(json);

  static MoviePeople fromJsonModel(Map<String, dynamic> json) => MoviePeople.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowPeople {
  final List<ShowCharacter>? cast;
  final List<ShowCrew>? crew, writing, directing, sound, production;
  
  @JsonKey(name: 'costume & make-up')
  final List<ShowCrew>? costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<ShowCrew>? visualEffects;

  ShowPeople(this.cast, this.crew, this.writing, this.directing, this.sound, this.production, this.costumeAndMakeUp, this.visualEffects);

  factory ShowPeople.fromJson(Map<String, dynamic> json) => _$ShowPeopleFromJson(json);

  static ShowPeople fromJsonModel(Map<String, dynamic> json) => ShowPeople.fromJson(json);
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
  final List<String> jobs;
  final Person person;
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  ShowCrew(this.jobs, this.person, this.episodeCount);

  factory ShowCrew.fromJson(Map<String, dynamic> json) => _$ShowCrewFromJson(json);

  static ShowCrew fromJsonModel(Map<String, dynamic> json) => ShowCrew.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PersonMovieCredits {
  final List<MovieCharacterCredits> cast;
  final List<MovieCrewCredits>? production, art, sound, writing, camera, directing, lighting, crew;

  @JsonKey(name: 'costume & make-up')
  final List<MovieCrewCredits> costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<MovieCrewCredits> visualEffects;

  PersonMovieCredits(this.cast, this.production, this.art, this.sound, this.writing, this.camera, this.directing, this.lighting, this.crew, this.costumeAndMakeUp, this.visualEffects);

  factory PersonMovieCredits.fromJson(Map<String, dynamic> json) => _$PersonMovieCreditsFromJson(json);

  static PersonMovieCredits fromJsonModel(Map<String, dynamic> json) => PersonMovieCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCharacterCredits {
  final List<String> characters;
  final Movie movie;

  MovieCharacterCredits(this.characters, this.movie);

  factory MovieCharacterCredits.fromJson(Map<String, dynamic> json) => _$MovieCharacterCreditsFromJson(json);

  static MovieCharacterCredits fromJsonModel(Map<String, dynamic> json) => MovieCharacterCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCrewCredits {
  final List<String> jobs;
  final Movie movie;

  MovieCrewCredits(this.jobs, this.movie);

  factory MovieCrewCredits.fromJson(Map<String, dynamic> json) => _$MovieCrewCreditsFromJson(json);

  static MovieCrewCredits fromJsonModel(Map<String, dynamic> json) => MovieCrewCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PersonShowCredits {
  final List<ShowCharacterCredits> cast;
  final List<ShowCrewCredits>? production, art, sound, writing, camera, directing, lighting, crew;

  @JsonKey(name: 'costume & make-up')
  final List<MovieCrewCredits> costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<MovieCrewCredits> visualEffects;

  PersonShowCredits(this.cast, this.production, this.art, this.sound, this.writing, this.camera, this.directing, this.lighting, this.crew, this.costumeAndMakeUp, this.visualEffects);

  factory PersonShowCredits.fromJson(Map<String, dynamic> json) => _$PersonShowCreditsFromJson(json);

  static PersonShowCredits fromJsonModel(Map<String, dynamic> json) => PersonShowCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCharacterCredits {
  final List<String> characters;
  final Show show;

  ShowCharacterCredits(this.characters, this.show);

  factory ShowCharacterCredits.fromJson(Map<String, dynamic> json) => _$ShowCharacterCreditsFromJson(json);

  static ShowCharacterCredits fromJsonModel(Map<String, dynamic> json) => ShowCharacterCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCrewCredits {
  final List<String> jobs;
  final Show show;

  ShowCrewCredits(this.jobs, this.show);

  factory ShowCrewCredits.fromJson(Map<String, dynamic> json) => _$ShowCrewCreditsFromJson(json);

  static ShowCrewCredits fromJsonModel(Map<String, dynamic> json) => ShowCrewCredits.fromJson(json);
}
