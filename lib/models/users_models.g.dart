// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['username'] as String,
      json['name'] as String,
      json['private'] as bool,
      json['vip'] as bool,
      json['vip_ep'] as bool,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['location'] as String?,
      json['about'] as String?,
      json['gender'] as String?,
      json['age'] as int?,
      json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      json['joined_at'] as String?,
    );

UserStats _$UserStatsFromJson(Map<String, dynamic> json) => UserStats(
      json['rating'] as int,
      json['play_count'] as int,
      json['completed_count'] as int,
    );

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      json['full'] as String,
    );
