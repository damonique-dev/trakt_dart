part of trakt_dart;

@JsonSerializable(createToJson: false)
class TraktList {
  final String name, description, privacy;
  final int likes;
  final User? user;
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
class TrendingPopularList {
  final TraktList list;

  @JsonKey(name: 'like_count')
  final int likeCount;

  @JsonKey(name: 'comment_count')
  final int commentCount;

  TrendingPopularList(this.list, this.likeCount, this.commentCount);

  factory TrendingPopularList.fromJson(Map<String, dynamic> json) =>
      _$TrendingPopularListFromJson(json);

  static TrendingPopularList fromJsonModel(Map<String, dynamic> json) =>
      TrendingPopularList.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ListLikes {
  @JsonKey(name: 'liked_at')
  final String likedAt;
  final User user;

  ListLikes(this.likedAt, this.user);

  factory ListLikes.fromJson(Map<String, dynamic> json) =>
      _$ListLikesFromJson(json);

  static ListLikes fromJsonModel(Map<String, dynamic> json) =>
      ListLikes.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ListItem {
  final int rank, id;

  @JsonKey(name: 'listed_at')
  final String listedAt;

  final String? notes;
  final String type;

  final Movie? movie;
  final Show? show;
  final Season? season;
  final Episode? episode;
  final Person? person;

  ListItem(this.rank, this.id, this.listedAt, this.notes, this.type, this.movie,
      this.show, this.season, this.episode, this.person);

  factory ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);

  static ListItem fromJsonModel(Map<String, dynamic> json) =>
      ListItem.fromJson(json);
}

enum ListCommentsSortBy { newest, oldest, likes, replies }

extension ListCommentsSortByValue on ListCommentsSortBy {
  String get value {
    switch (this) {
      case ListCommentsSortBy.newest:
        return "newest";
      case ListCommentsSortBy.oldest:
        return "oldest";
      case ListCommentsSortBy.likes:
        return "likes";
      case ListCommentsSortBy.replies:
        return "replies";
    }
  }
}
