import 'package:json_annotation/json_annotation.dart';
import 'package:trakt_dart/models/users_models.dart';

part 'common_models.g.dart';

@JsonSerializable(createToJson: false)
class MovieShowMetadata {
  final String title;
  final int year;
  final Ids ids;

  MovieShowMetadata(this.title, this.year, this.ids);

  factory MovieShowMetadata.fromJson(Map<String, dynamic> json) => _$MovieShowMetadataFromJson(json);
}

@JsonSerializable(createToJson: false)
class Ids {
  final String slug;
  final int? trakt, tmdb, tvdb;
  final String? imdb;

  Ids(this.trakt, this.slug, this.tvdb, this.imdb, this.tmdb);

  factory Ids.fromJson(Map<String, dynamic> json) => _$IdsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Comment {
  final int id, replies, likes;
  final String comment;
  final bool spoiler, review;
  final User user;

  @JsonKey(name: 'parent_id')
  final int parentId;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'user_rating')
  final int userRating;

  @JsonKey(name: 'user_stats')
  final UserStats userStats;

  Comment(this.id, this.replies, this.likes, this.comment, this.spoiler, this.review, this.parentId, this.createdAt, this.updatedAt, this.userRating, this.userStats, this.user);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}

@JsonSerializable(createToJson: false)
class TraktList {
  final String name, description, privacy;
  final int likes;
  final User user;
  final Ids ids;
  
  @JsonKey(name: 'display_numbers')
  final bool displayNumbers;

  @JsonKey(name: 'allow_comments')
  final bool allowComments;

  @JsonKey(name: 'sort_by')
  final String sortBy;

  @JsonKey(name: 'sort_how')
  final String sortHow;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'item_count')
  final int itemCount;

  @JsonKey(name: 'comment_count')
  final int commentCount;

  TraktList(this.name, this.description, this.privacy, this.likes, this.user, this.ids, this.displayNumbers, this.allowComments, this.sortBy, this.sortHow, this.createdAt, this.updatedAt, this.itemCount, this.commentCount);

  factory TraktList.fromJson(Map<String, dynamic> json) => _$TraktListFromJson(json);
}

@JsonSerializable(createToJson: false)
class Rating {
  final double rating;
  final int votes;
  // Keys are "1" - "10"
  final Map<String, int> distribution;

  Rating(this.rating, this.votes, this.distribution);

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@JsonSerializable(createToJson: false)
class Stats {
  final int watchers, plays, collectors, comments, lists, votes, recommended;

  Stats(this.watchers, this.plays, this.collectors, this.comments, this.lists, this.votes, this.recommended);

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
