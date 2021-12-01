part of trakt_dart;

@JsonSerializable()
class CommentSharing {
  final bool twitter, tumblr, medium;

  CommentSharing(
      {required this.twitter, required this.tumblr, required this.medium});

  factory CommentSharing.fromJson(Map<String, dynamic> json) =>
      _$CommentSharingFromJson(json);
  Map<String, dynamic> toJson() => _$CommentSharingToJson(this);

  static CommentSharing fromJsonModel(Map<String, dynamic> json) =>
      CommentSharing.fromJson(json);
}

@JsonSerializable(createToJson: false)
class CommentResponse {
  final int id, replies, likes;
  final CommentSharing? sharing;
  final String comment;
  final bool spoiler, review;
  final User user;

  @JsonKey(name: 'parent_id')
  final int parentId;

  @JsonKey(name: 'user_stats')
  final UserStats userStats;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  CommentResponse(
      this.id,
      this.replies,
      this.likes,
      this.sharing,
      this.comment,
      this.spoiler,
      this.review,
      this.user,
      this.parentId,
      this.userStats,
      this.createdAt,
      this.updatedAt);

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);

  static CommentResponse fromJsonModel(Map<String, dynamic> json) =>
      CommentResponse.fromJson(json);
}

@JsonSerializable(createToJson: false)
class CommentMediaItem {
  final String type;
  final Movie? movie;
  final Show? show;
  final Episode? episode;
  final TraktList? list;

  CommentMediaItem(this.type, this.movie, this.show, this.episode, this.list);

  factory CommentMediaItem.fromJson(Map<String, dynamic> json) =>
      _$CommentMediaItemFromJson(json);

  static CommentMediaItem fromJsonModel(Map<String, dynamic> json) =>
      CommentMediaItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class CommentLike {
  @JsonKey(name: 'liked_at')
  final String likedAt;
  final User user;

  CommentLike(this.likedAt, this.user);

  factory CommentLike.fromJson(Map<String, dynamic> json) =>
      _$CommentLikeFromJson(json);

  static CommentLike fromJsonModel(Map<String, dynamic> json) =>
      CommentLike.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MediaComment {
  final String type;
  final Movie? movie;
  final Show? show;
  final Season? season;
  final Episode? episode;
  final TraktList? list;
  final Comment comment;

  MediaComment(this.type, this.movie, this.show, this.season, this.episode,
      this.list, this.comment);

  factory MediaComment.fromJson(Map<String, dynamic> json) =>
      _$MediaCommentFromJson(json);

  static MediaComment fromJsonModel(Map<String, dynamic> json) =>
      MediaComment.fromJson(json);
}

enum CommentType { all, reviews, shouts }

extension CommentTypeValue on CommentType {
  String get value {
    switch (this) {
      case CommentType.all:
        return "all";
      case CommentType.reviews:
        return "reviews";
      case CommentType.shouts:
        return "shouts";
    }
  }
}
