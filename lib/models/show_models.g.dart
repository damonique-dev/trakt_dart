// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
      json['title'] as String,
      json['year'] as int?,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['overview'] as String?,
      json['certification'] as String?,
      json['network'] as String?,
      json['country'] as String?,
      json['trailer'] as String?,
      json['homepage'] as String?,
      json['status'] as String?,
      json['updated_at'] as String?,
      json['language'] as String?,
      json['runtime'] as int?,
      json['votes'] as int?,
      json['airs'] == null
          ? null
          : AirTime.fromJson(json['airs'] as Map<String, dynamic>),
      (json['rating'] as num?)?.toDouble(),
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['first_aired'] as String?,
      json['comment_count'] as int?,
      (json['available_translations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['aired_episodes'] as int?,
    );

AirTime _$AirTimeFromJson(Map<String, dynamic> json) => AirTime(
      json['day'] as String?,
      json['time'] as String?,
      json['timezone'] as String?,
    );

TrendingShow _$TrendingShowFromJson(Map<String, dynamic> json) => TrendingShow(
      json['watchers'] as int,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

RecommendedShow _$RecommendedShowFromJson(Map<String, dynamic> json) =>
    RecommendedShow(
      json['user_count'] as int,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

PlayedWatchedCollectedShow _$PlayedWatchedCollectedShowFromJson(
        Map<String, dynamic> json) =>
    PlayedWatchedCollectedShow(
      json['watcher_count'] as int,
      json['play_count'] as int,
      json['collected_count'] as int,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

AnticipatedShow _$AnticipatedShowFromJson(Map<String, dynamic> json) =>
    AnticipatedShow(
      json['list_count'] as int,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

UpdatedShow _$UpdatedShowFromJson(Map<String, dynamic> json) => UpdatedShow(
      json['updated_at'] as String,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

ShowCertification _$ShowCertificationFromJson(Map<String, dynamic> json) =>
    ShowCertification(
      json['certification'] as String,
      json['country'] as String,
    );

ShowTranslation _$ShowTranslationFromJson(Map<String, dynamic> json) =>
    ShowTranslation(
      json['title'] as String?,
      json['overview'] as String?,
      json['language'] as String?,
    );

ShowStats _$ShowStatsFromJson(Map<String, dynamic> json) => ShowStats(
      json['watchers'] as int,
      json['plays'] as int,
      json['collectors'] as int,
      json['comments'] as int,
      json['lists'] as int,
      json['votes'] as int,
      json['recommended'] as int,
      json['collected_episodes'] as int,
    );
