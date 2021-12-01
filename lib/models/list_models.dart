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

@JsonSerializable(createToJson: false)
class ReorderListResponse {
  @JsonKey(name: 'skipped_ids')
  final List<int> skippedIds;
  final int updated;

  ReorderListResponse(this.skippedIds, this.updated);

  factory ReorderListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReorderListResponseFromJson(json);

  static ReorderListResponse fromJsonModel(Map<String, dynamic> json) =>
      ReorderListResponse.fromJson(json);
}

@JsonSerializable(createToJson: false)
class AddToCustomListResponse {
  final UpdatedCustomListMetadata added, existing;

  @JsonKey(name: 'not_found')
  final UpdatedCustomListNotFound notFound;

  AddToCustomListResponse(this.added, this.existing, this.notFound);

  factory AddToCustomListResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCustomListResponseFromJson(json);

  static AddToCustomListResponse fromJsonModel(Map<String, dynamic> json) =>
      AddToCustomListResponse.fromJson(json);
}

@JsonSerializable(createToJson: false)
class RemoveFromCustomListResponse {
  final UpdatedCustomListMetadata deleted;

  @JsonKey(name: 'not_found')
  final UpdatedCustomListNotFound notFound;

  RemoveFromCustomListResponse(this.deleted, this.notFound);

  factory RemoveFromCustomListResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveFromCustomListResponseFromJson(json);

  static RemoveFromCustomListResponse fromJsonModel(
          Map<String, dynamic> json) =>
      RemoveFromCustomListResponse.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdatedCustomListMetadata {
  final int movies, shows, seasons, episodes, people;

  UpdatedCustomListMetadata(
      this.movies, this.shows, this.seasons, this.episodes, this.people);

  factory UpdatedCustomListMetadata.fromJson(Map<String, dynamic> json) =>
      _$UpdatedCustomListMetadataFromJson(json);

  static UpdatedCustomListMetadata fromJsonModel(Map<String, dynamic> json) =>
      UpdatedCustomListMetadata.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdatedCustomListNotFound {
  final List<Map<String, dynamic>> movies, shows, seasons, episodes, people;

  UpdatedCustomListNotFound(
      this.movies, this.shows, this.seasons, this.episodes, this.people);

  factory UpdatedCustomListNotFound.fromJson(Map<String, dynamic> json) =>
      _$UpdatedCustomListNotFoundFromJson(json);

  static UpdatedCustomListNotFound fromJsonModel(Map<String, dynamic> json) =>
      UpdatedCustomListNotFound.fromJson(json);
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

enum CustomListPrivacy { private, friends, public }

extension CustomListPrivacyValue on CustomListPrivacy {
  String get value {
    switch (this) {
      case CustomListPrivacy.private:
        return "private";
      case CustomListPrivacy.friends:
        return "friends";
      case CustomListPrivacy.public:
        return "public";
    }
  }
}

enum CustomListSort {
  rank,
  added,
  title,
  released,
  runtime,
  popularity,
  percentage,
  votes,
  myRating,
  random,
  watched,
  collected
}

extension CustomListSortValue on CustomListSort {
  String get value {
    switch (this) {
      case CustomListSort.rank:
        return "rank";
      case CustomListSort.added:
        return "added";
      case CustomListSort.title:
        return "title";
      case CustomListSort.released:
        return "released";
      case CustomListSort.runtime:
        return "runtime";
      case CustomListSort.popularity:
        return "popularity";
      case CustomListSort.percentage:
        return "percentage";
      case CustomListSort.votes:
        return "votes";
      case CustomListSort.myRating:
        return "my_rating";
      case CustomListSort.random:
        return "random";
      case CustomListSort.watched:
        return "watched";
      case CustomListSort.collected:
        return "collected";
    }
  }
}

enum CustomListSortHow { asc, desc }

extension CustomListSortHowValue on CustomListSortHow {
  String get value {
    switch (this) {
      case CustomListSortHow.asc:
        return "asc";
      case CustomListSortHow.desc:
        return "desc";
    }
  }
}
