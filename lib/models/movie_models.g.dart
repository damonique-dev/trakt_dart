// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['title'] as String,
      json['overview'] as String?,
      json['country'] as String?,
      json['language'] as String?,
      json['certification'] as String?,
      json['year'] as int,
      json['runtime'] as int?,
      json['votes'] as int?,
      json['comment_count'] as int?,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['tagline'] as String?,
      json['trailer'] as String?,
      json['homepage'] as String?,
      json['status'] as String?,
      (json['rating'] as num?)?.toDouble(),
      (json['available_translations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['released'] as String?,
      json['updatedAt'] as String?,
    );

TrendingMovie _$TrendingMovieFromJson(Map<String, dynamic> json) =>
    TrendingMovie(
      json['watchers'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

RecommendedMovie _$RecommendedMovieFromJson(Map<String, dynamic> json) =>
    RecommendedMovie(
      json['userCount'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

PlayedWatchedCollectedMovie _$PlayedWatchedCollectedMovieFromJson(
        Map<String, dynamic> json) =>
    PlayedWatchedCollectedMovie(
      json['watcher_count'] as int,
      json['play_count'] as int,
      json['collected_count'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

AnticipatedMovie _$AnticipatedMovieFromJson(Map<String, dynamic> json) =>
    AnticipatedMovie(
      json['list_count'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

BoxOfficeMovie _$BoxOfficeMovieFromJson(Map<String, dynamic> json) =>
    BoxOfficeMovie(
      json['revenue'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

UpdatedMovie _$UpdatedMovieFromJson(Map<String, dynamic> json) => UpdatedMovie(
      json['updated_at'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

MovieAlias _$MovieAliasFromJson(Map<String, dynamic> json) => MovieAlias(
      json['title'] as String,
      json['country'] as String,
    );

MovieRelease _$MovieReleaseFromJson(Map<String, dynamic> json) => MovieRelease(
      json['country'] as String,
      json['certification'] as String,
      json['release_date'] as String,
      json['release_type'] as String,
      json['note'] as String,
    );

MovieTranslation _$MovieTranslationFromJson(Map<String, dynamic> json) =>
    MovieTranslation(
      json['title'] as String,
      json['overview'] as String,
      json['tagline'] as String,
      json['language'] as String,
    );

MoviePeople _$MoviePeopleFromJson(Map<String, dynamic> json) => MoviePeople(
      (json['cast'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['production'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['art'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sound'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['writing'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['camera'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['directing'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lighting'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['costume & make-up'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['visual effects'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['character'] as String,
      (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
      Person.fromJson(json['person'] as Map<String, dynamic>),
    );

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      json['job'] as String,
      (json['jobs'] as List<dynamic>).map((e) => e as String).toList(),
      Person.fromJson(json['person'] as Map<String, dynamic>),
    );
