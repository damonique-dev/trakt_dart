// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieShowMetadata _$MovieShowMetadataFromJson(Map<String, dynamic> json) =>
    MovieShowMetadata(
      json['title'] as String,
      json['year'] as int,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
    );

Ids _$IdsFromJson(Map<String, dynamic> json) => Ids(
      json['trakt'] as int?,
      json['slug'] as String,
      json['tvdb'] as int?,
      json['imdb'] as String?,
      json['tmdb'] as int?,
    );

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      json['id'] as int,
      json['replies'] as int,
      json['likes'] as int,
      json['comment'] as String,
      json['spoiler'] as bool,
      json['review'] as bool,
      json['parent_id'] as int,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['user_rating'] as int,
      UserStats.fromJson(json['user_stats'] as Map<String, dynamic>),
      User.fromJson(json['user'] as Map<String, dynamic>),
    );

TraktList _$TraktListFromJson(Map<String, dynamic> json) => TraktList(
      json['name'] as String,
      json['description'] as String,
      json['privacy'] as String,
      json['likes'] as int,
      User.fromJson(json['user'] as Map<String, dynamic>),
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['display_numbers'] as bool,
      json['allow_comments'] as bool,
      json['sort_by'] as String,
      json['sort_how'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['item_count'] as int,
      json['comment_count'] as int,
    );

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      (json['rating'] as num).toDouble(),
      json['votes'] as int,
      Map<String, int>.from(json['distribution'] as Map),
    );

MovieShowAlias _$MovieShowAliasFromJson(Map<String, dynamic> json) =>
    MovieShowAlias(
      json['title'] as String,
      json['country'] as String,
    );
