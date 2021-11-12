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
    );
