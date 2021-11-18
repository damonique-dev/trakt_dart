part of trakt_dart;

// import 'package:json_annotation/json_annotation.dart';
// import 'package:trakt_dart/models/users_models.dart';

// part 'common_models.g.dart';

enum TimePeriod { daily, weekly, monthly, yearly, all }

extension TimePeriodValue on TimePeriod {
  String get value {
    switch (this) {
      case TimePeriod.weekly:
        return "weekly";
      case TimePeriod.monthly:
        return "monthly";
      case TimePeriod.yearly:
        return "yearly";
      case TimePeriod.all:
        return "all";
      case TimePeriod.daily:
        return "daily";
    }
  }
}

enum CommentsSortBy { newest, oldest, likes, replies, highest, lowest, plays }

extension CommentsSortByValue on CommentsSortBy {
  String get value {
    switch (this) {
      case CommentsSortBy.newest:
        return "newest";
      case CommentsSortBy.oldest:
        return "oldest";
      case CommentsSortBy.likes:
        return "likes";
      case CommentsSortBy.replies:
        return "replies";
      case CommentsSortBy.highest:
        return "highest";
      case CommentsSortBy.lowest:
        return "lowest";
      case CommentsSortBy.plays:
        return "plays";
    }
  }
}

enum ListType { all, personal, official, watchlists, recommendations }

extension ListTypeValue on ListType {
  String get value {
    switch (this) {
      case ListType.all:
        return "all";
      case ListType.personal:
        return "personal";
      case ListType.official:
        return "official";
      case ListType.watchlists:
        return "watchlists";
      case ListType.recommendations:
        return "recommendations";
    }
  }
}

enum ListSort { popular, likes, comments, items, added, updated }

extension ListSortValue on ListSort {
  String get value {
    switch (this) {
      case ListSort.popular:
        return "popular";
      case ListSort.likes:
        return "likes";
      case ListSort.comments:
        return "comments";
      case ListSort.items:
        return "items";
      case ListSort.added:
        return "added";
      case ListSort.updated:
        return "updated";
    }
  }
}

@JsonSerializable(createToJson: false)
class MovieShowMetadata {
  final String title;
  final int year;
  final Ids ids;

  MovieShowMetadata(this.title, this.year, this.ids);

  factory MovieShowMetadata.fromJson(Map<String, dynamic> json) =>
      _$MovieShowMetadataFromJson(json);

  static MovieShowMetadata fromJsonModel(Map<String, dynamic> json) =>
      MovieShowMetadata.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Ids {
  final String? slug;
  final int? trakt, tmdb, tvdb;
  final String? imdb;

  Ids(this.trakt, this.slug, this.tvdb, this.imdb, this.tmdb);

  factory Ids.fromJson(Map<String, dynamic> json) => _$IdsFromJson(json);

  static Ids fromJsonModel(Map<String, dynamic> json) => Ids.fromJson(json);
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
  final int? userRating;

  @JsonKey(name: 'user_stats')
  final UserStats userStats;

  Comment(
      this.id,
      this.replies,
      this.likes,
      this.comment,
      this.spoiler,
      this.review,
      this.parentId,
      this.createdAt,
      this.updatedAt,
      this.userRating,
      this.userStats,
      this.user);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  static Comment fromJsonModel(Map<String, dynamic> json) =>
      Comment.fromJson(json);
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
  final int? itemCount;

  @JsonKey(name: 'comment_count')
  final int commentCount;

  TraktList(
      this.name,
      this.description,
      this.privacy,
      this.likes,
      this.user,
      this.ids,
      this.displayNumbers,
      this.allowComments,
      this.sortBy,
      this.sortHow,
      this.createdAt,
      this.updatedAt,
      this.itemCount,
      this.commentCount);

  factory TraktList.fromJson(Map<String, dynamic> json) =>
      _$TraktListFromJson(json);

  static TraktList fromJsonModel(Map<String, dynamic> json) =>
      TraktList.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Rating {
  final double rating;
  final int votes;
  // Keys are "1" - "10"
  final Map<String, int> distribution;

  Rating(this.rating, this.votes, this.distribution);

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  static Rating fromJsonModel(Map<String, dynamic> json) =>
      Rating.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieShowAlias {
  final String title, country;

  MovieShowAlias(this.title, this.country);

  factory MovieShowAlias.fromJson(Map<String, dynamic> json) =>
      _$MovieShowAliasFromJson(json);

  static MovieShowAlias fromJsonModel(Map<String, dynamic> json) =>
      MovieShowAlias.fromJson(json);
}
