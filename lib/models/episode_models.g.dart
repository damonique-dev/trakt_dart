// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      json['season'] as int,
      json['number'] as int,
      json['title'] as String,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['overview'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['votes'] as int?,
      json['runtime'] as int?,
      json['comment_count'] as int?,
      json['first_aired'] as String?,
      json['updated_at'] as String?,
      (json['available_translations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

EpisodeStats _$EpisodeStatsFromJson(Map<String, dynamic> json) => EpisodeStats(
      json['watchers'] as int,
      json['plays'] as int,
      json['collectors'] as int,
      json['comments'] as int,
      json['lists'] as int,
      json['votes'] as int,
    );
