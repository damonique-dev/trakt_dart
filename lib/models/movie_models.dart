import 'package:json_annotation/json_annotation.dart';
import 'package:trakt_dart/models/common_models.dart';
import 'package:trakt_dart/models/people_models.dart';

part 'movie_models.g.dart';

@JsonSerializable(createToJson: false)
class Movie {
  // Extended: metadata (minimum data provided)
  final String title;
  final int year;
  final Ids ids;

  // Extended: full
  final String? overview, country, language, certification, tagline, trailer, homepage, status, released, updatedAt;
  final int? runtime, votes;
  final double? rating;
  @JsonKey(name: 'available_translations')
  final List<String>? availableTranslations;
  final List<String>? genres;
  @JsonKey(name: 'comment_count')
  final int? commentCount;

  Movie(this.title, this.overview, this.country, this.language, this.certification, this.year, this.runtime, this.votes, this.commentCount, this.ids, this.tagline, this.trailer, this.homepage, this.status, this.rating, this.availableTranslations, this.genres, this.released, this.updatedAt);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

@JsonSerializable(createToJson: false)
class TrendingMovie {
  final int watchers;
  final Movie movie;

  TrendingMovie(this.watchers, this.movie);

  factory TrendingMovie.fromJson(Map<String, dynamic> json) => _$TrendingMovieFromJson(json);
}

@JsonSerializable(createToJson: false)
class RecommendedMovie {
  final int userCount;
  final Movie movie;

  RecommendedMovie(this.userCount, this.movie);

  factory RecommendedMovie.fromJson(Map<String, dynamic> json) => _$RecommendedMovieFromJson(json);
}

@JsonSerializable(createToJson: false)
class PlayedWatchedCollectedMovie {
  @JsonKey(name: 'watcher_count')
  final int watcherCount;
  @JsonKey(name: 'play_count')
  final int playCount;
  @JsonKey(name: 'collected_count')
  final int collectedCount;
  final Movie movie;

  PlayedWatchedCollectedMovie(this.watcherCount, this.playCount, this.collectedCount, this.movie);

  factory PlayedWatchedCollectedMovie.fromJson(Map<String, dynamic> json) => _$PlayedWatchedCollectedMovieFromJson(json);
}

@JsonSerializable(createToJson: false)
class AnticipatedMovie {
  @JsonKey(name: 'list_count')
  final int listCount;
  final Movie movie;

  AnticipatedMovie(this.listCount, this.movie);

  factory AnticipatedMovie.fromJson(Map<String, dynamic> json) => _$AnticipatedMovieFromJson(json);
}

@JsonSerializable(createToJson: false)
class BoxOfficeMovie {
  final int revenue;
  final Movie movie;

  BoxOfficeMovie(this.revenue, this.movie);

  factory BoxOfficeMovie.fromJson(Map<String, dynamic> json) => _$BoxOfficeMovieFromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdatedMovie {
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  final Movie movie;

  UpdatedMovie(this.updatedAt, this.movie);

  factory UpdatedMovie.fromJson(Map<String, dynamic> json) => _$UpdatedMovieFromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieAlias {
  final String title, country;

  MovieAlias(this.title, this.country);

  factory MovieAlias.fromJson(Map<String, dynamic> json) => _$MovieAliasFromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieRelease {
  final String country, certification, release_date, release_type, note;

  MovieRelease(this.country, this.certification, this.release_date, this.release_type, this.note);

  factory MovieRelease.fromJson(Map<String, dynamic> json) => _$MovieReleaseFromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieTranslation {
  final String title, overview, tagline, language;

  MovieTranslation(this.title, this.overview, this.tagline, this.language);

  factory MovieTranslation.fromJson(Map<String, dynamic> json) => _$MovieTranslationFromJson(json);
}

@JsonSerializable(createToJson: false)
class MoviePeople {
  final List<Character> cast;
  final List<Crew> production;
  final List<Crew> art;
  final List<Crew> sound;
  final List<Crew> writing;
  final List<Crew> camera;
  final List<Crew> directing;
  final List<Crew> lighting;
  final List<Crew> crew;

  @JsonKey(name: 'costume & make-up')
  final List<Crew> costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<Crew> visualEffects;

  MoviePeople(this.cast, this.production, this.art, this.sound, this.writing, this.camera, this.directing, this.lighting, this.crew, this.costumeAndMakeUp, this.visualEffects);

  factory MoviePeople.fromJson(Map<String, dynamic> json) => _$MoviePeopleFromJson(json);
}

@JsonSerializable(createToJson: false)
class Character {
  final String character;
  final List<String> characters;
  final Person person;

  Character(this.character, this.characters, this.person);

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
}

@JsonSerializable(createToJson: false)
class Crew {
  final String job;
  final List<String> jobs;
  final Person person;

  Crew(this.job, this.jobs, this.person);

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
}
