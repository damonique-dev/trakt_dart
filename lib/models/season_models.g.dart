// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      json['number'] as int,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['title'] as String?,
      json['overview'] as String?,
      json['network'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['votes'] as int?,
      json['episode_count'] as int?,
      json['aired_episodes'] as int?,
      json['first_aired'] as String?,
      json['updated_at'] as String?,
    );
