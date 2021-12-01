part of trakt_dart;

@JsonSerializable(createToJson: false)
class User {
  // Extended: metadata (minimum data provided)
  final String username;
  final bool private;
  @JsonKey(defaultValue: false)
  final bool vip;
  final Ids ids;

  @JsonKey(name: 'vip_ep', defaultValue: false)
  final bool vipEp;

  // Extended: full
  final String? name, location, about, gender;
  final int? age;
  final Images? images;

  @JsonKey(name: 'joined_at')
  final String? joinedAt;

  // Extended: VIP
  @JsonKey(name: 'vip_og')
  final bool? vipOG;
  @JsonKey(name: 'vip_years')
  final int? vipYears;
  @JsonKey(name: 'vip_cover_image')
  final String? vipCoverImage;

  User(
      this.username,
      this.name,
      this.private,
      this.vip,
      this.vipEp,
      this.ids,
      this.location,
      this.about,
      this.gender,
      this.age,
      this.images,
      this.joinedAt,
      this.vipOG,
      this.vipYears,
      this.vipCoverImage);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static User fromJsonModel(Map<String, dynamic> json) => User.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserStats {
  final int? rating;

  @JsonKey(name: 'play_count')
  final int playCount;

  @JsonKey(name: 'completed_count')
  final int completedCount;

  UserStats(this.rating, this.playCount, this.completedCount);

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);

  static UserStats fromJsonModel(Map<String, dynamic> json) =>
      UserStats.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Images {
  final Avatar avatar;

  Images(this.avatar);

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  static Images fromJsonModel(Map<String, dynamic> json) =>
      Images.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Avatar {
  final String full;

  Avatar(this.full);

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  static Avatar fromJsonModel(Map<String, dynamic> json) =>
      Avatar.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserSettings {
  final User user;
  final UserAccount account;
  final UserConnections connections;

  @JsonKey(name: 'sharing_text')
  final UserSharingText sharingText;

  UserSettings(this.user, this.account, this.connections, this.sharingText);

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  static UserSettings fromJsonModel(Map<String, dynamic> json) =>
      UserSettings.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserAccount {
  final String timezone;

  @JsonKey(name: 'date_format')
  final String dateFormat;

  @JsonKey(name: 'time_24hr')
  final bool time24hr;

  @JsonKey(name: 'cover_image')
  final String? coverImage;

  UserAccount(this.timezone, this.dateFormat, this.time24hr, this.coverImage);

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  static UserAccount fromJsonModel(Map<String, dynamic> json) =>
      UserAccount.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserConnections {
  final bool facebook, twitter, google, tumblr, medium, slack, apple;

  UserConnections(this.facebook, this.twitter, this.google, this.tumblr,
      this.medium, this.slack, this.apple);

  factory UserConnections.fromJson(Map<String, dynamic> json) =>
      _$UserConnectionsFromJson(json);

  static UserConnections fromJsonModel(Map<String, dynamic> json) =>
      UserConnections.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserSharingText {
  final String? watching, watched, rated;

  UserSharingText(this.watching, this.watched, this.rated);

  factory UserSharingText.fromJson(Map<String, dynamic> json) =>
      _$UserSharingTextFromJson(json);

  static UserSharingText fromJsonModel(Map<String, dynamic> json) =>
      UserSharingText.fromJson(json);
}

@JsonSerializable(createToJson: false)
class FollowRequest {
  final int id;
  final User user;

  @JsonKey(name: 'requested_at')
  final String requestedAt;

  FollowRequest(this.id, this.user, this.requestedAt);

  factory FollowRequest.fromJson(Map<String, dynamic> json) =>
      _$FollowRequestFromJson(json);

  static FollowRequest fromJsonModel(Map<String, dynamic> json) =>
      FollowRequest.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Follower {
  final User user;

  @JsonKey(name: 'followed_at')
  final String followedAt;

  Follower(this.user, this.followedAt);

  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);

  static Follower fromJsonModel(Map<String, dynamic> json) =>
      Follower.fromJson(json);
}

@JsonSerializable(createToJson: false)
class HiddenItem {
  final String type;
  final Movie? movie;
  final Show? show;
  final Season? season;

  @JsonKey(name: 'hidden_at')
  final String hiddenAt;

  HiddenItem(this.type, this.movie, this.show, this.season, this.hiddenAt);

  factory HiddenItem.fromJson(Map<String, dynamic> json) =>
      _$HiddenItemFromJson(json);

  static HiddenItem fromJsonModel(Map<String, dynamic> json) =>
      HiddenItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserLike {
  final String type;
  @JsonKey(name: 'liked_at')
  final String likedAt;
  final Comment? comment;
  final TraktList? list;

  UserLike(this.type, this.likedAt, this.comment, this.list);

  factory UserLike.fromJson(Map<String, dynamic> json) =>
      _$UserLikeFromJson(json);

  static UserLike fromJsonModel(Map<String, dynamic> json) =>
      UserLike.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserCollectionItem {
  final Movie? movie;
  final Show? show;
  final List<CollectedSeason>? seasons;
  final Metadata? metadata;

  // For Movies
  @JsonKey(name: 'collected_at')
  final String? collectedAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  // For Shows
  @JsonKey(name: 'last_collected_at')
  final String? lastCollectedAt;
  @JsonKey(name: 'last_updated_at')
  final String? lastUpdatedAt;

  UserCollectionItem(this.movie, this.show, this.collectedAt, this.updatedAt,
      this.seasons, this.metadata, this.lastCollectedAt, this.lastUpdatedAt);

  factory UserCollectionItem.fromJson(Map<String, dynamic> json) =>
      _$UserCollectionItemFromJson(json);

  static UserCollectionItem fromJsonModel(Map<String, dynamic> json) =>
      UserCollectionItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Following {
  final User user;

  @JsonKey(name: 'approved_at')
  final String? approvedAt;

  Following(this.user, this.approvedAt);

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);

  static Following fromJsonModel(Map<String, dynamic> json) =>
      Following.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Friend {
  final User user;

  @JsonKey(name: 'friends_at')
  final String friendsAt;

  Friend(this.user, this.friendsAt);

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  static Friend fromJsonModel(Map<String, dynamic> json) =>
      Friend.fromJson(json);
}

@JsonSerializable(createToJson: false)
class HistoryItem {
  final int id;
  @JsonKey(name: 'watched_at')
  final String watchedAt;
  final String action, type;

  final Movie? movie;
  final Episode? episode;
  final Show? show;

  HistoryItem(this.id, this.watchedAt, this.action, this.type, this.movie,
      this.episode, this.show);

  factory HistoryItem.fromJson(Map<String, dynamic> json) =>
      _$HistoryItemFromJson(json);

  static HistoryItem fromJsonModel(Map<String, dynamic> json) =>
      HistoryItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class RatedItem {
  final int rating;
  @JsonKey(name: 'rated_at')
  final String ratedAt;
  final String type;

  final Movie? movie;
  final Episode? episode;
  final Season? season;
  final Show? show;

  RatedItem(this.rating, this.ratedAt, this.type, this.movie, this.episode,
      this.season, this.show);

  factory RatedItem.fromJson(Map<String, dynamic> json) =>
      _$RatedItemFromJson(json);

  static RatedItem fromJsonModel(Map<String, dynamic> json) =>
      RatedItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class WatchlistItem {
  final int rank;
  @JsonKey(name: 'listed_at')
  final String listedAt;
  final String type;

  final Movie? movie;
  final Episode? episode;
  final Season? season;
  final Show? show;

  WatchlistItem(this.rank, this.listedAt, this.type, this.movie, this.episode,
      this.season, this.show);

  factory WatchlistItem.fromJson(Map<String, dynamic> json) =>
      _$WatchlistItemFromJson(json);

  static WatchlistItem fromJsonModel(Map<String, dynamic> json) =>
      WatchlistItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PersonalRecommendation {
  final int rank;
  @JsonKey(name: 'listed_at')
  final String listedAt;
  final String type;
  final String? notes;

  final Movie? movie;
  final Episode? episode;
  final Season? season;
  final Show? show;

  PersonalRecommendation(this.rank, this.listedAt, this.type, this.notes,
      this.movie, this.episode, this.season, this.show);

  factory PersonalRecommendation.fromJson(Map<String, dynamic> json) =>
      _$PersonalRecommendationFromJson(json);

  static PersonalRecommendation fromJsonModel(Map<String, dynamic> json) =>
      PersonalRecommendation.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Watching {
  final String? action, type;

  @JsonKey(name: 'expires_at')
  final String? expiresAt;

  @JsonKey(name: 'started_at')
  final String? startedAt;

  final Movie? movie;
  final Episode? episode;
  final Show? show;

  Watching(this.action, this.type, this.expiresAt, this.startedAt, this.movie,
      this.episode, this.show);

  factory Watching.fromJson(Map<String, dynamic> json) =>
      _$WatchingFromJson(json);

  static Watching fromJsonModel(Map<String, dynamic> json) =>
      Watching.fromJson(json);
}

@JsonSerializable(createToJson: false)
class WatchedItem {
  final int plays;

  @JsonKey(name: 'last_watched_at')
  final String? lastWatchedAt;

  @JsonKey(name: 'last_updated_at')
  final String? lastUpdatedAt;

  final Movie? movie;
  final Show? show;
  final List<WatchedSeason>? seasons;

  WatchedItem(this.plays, this.lastWatchedAt, this.lastUpdatedAt, this.movie,
      this.show, this.seasons);

  factory WatchedItem.fromJson(Map<String, dynamic> json) =>
      _$WatchedItemFromJson(json);

  static WatchedItem fromJsonModel(Map<String, dynamic> json) =>
      WatchedItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class Stats {
  final UserMovieSEpisodeStats movies, episodes;
  final UserShowStats shows;
  final UserSeasonStats seasons;
  final UserNetworkStats network;
  final UserRatingStats ratings;

  Stats(this.movies, this.episodes, this.shows, this.seasons, this.network,
      this.ratings);

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  static Stats fromJsonModel(Map<String, dynamic> json) => Stats.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserMovieSEpisodeStats {
  final int plays, watched, minutes, collected, ratings, comments;

  UserMovieSEpisodeStats(this.plays, this.watched, this.minutes, this.collected,
      this.ratings, this.comments);

  factory UserMovieSEpisodeStats.fromJson(Map<String, dynamic> json) =>
      _$UserMovieSEpisodeStatsFromJson(json);

  static UserMovieSEpisodeStats fromJsonModel(Map<String, dynamic> json) =>
      UserMovieSEpisodeStats.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserShowStats {
  final int watched, collected, ratings, comments;

  UserShowStats(this.watched, this.collected, this.ratings, this.comments);

  factory UserShowStats.fromJson(Map<String, dynamic> json) =>
      _$UserShowStatsFromJson(json);

  static UserShowStats fromJsonModel(Map<String, dynamic> json) =>
      UserShowStats.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserNetworkStats {
  final int friends, followers, following;

  UserNetworkStats(this.friends, this.followers, this.following);

  factory UserNetworkStats.fromJson(Map<String, dynamic> json) =>
      _$UserNetworkStatsFromJson(json);

  static UserNetworkStats fromJsonModel(Map<String, dynamic> json) =>
      UserNetworkStats.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserSeasonStats {
  final int ratings, comments;

  UserSeasonStats(this.ratings, this.comments);

  factory UserSeasonStats.fromJson(Map<String, dynamic> json) =>
      _$UserSeasonStatsFromJson(json);

  static UserSeasonStats fromJsonModel(Map<String, dynamic> json) =>
      UserSeasonStats.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UserRatingStats {
  final int total;
  // Keys are "1" - "10"
  final Map<String, int> distribution;

  UserRatingStats(this.total, this.distribution);

  factory UserRatingStats.fromJson(Map<String, dynamic> json) =>
      _$UserRatingStatsFromJson(json);

  static UserRatingStats fromJsonModel(Map<String, dynamic> json) =>
      UserRatingStats.fromJson(json);
}

enum HiddenItemSection {
  calendar,
  progressWatched,
  progressWatchedReset,
  progressCollected,
  recommendations
}

extension HiddenItemSectionValue on HiddenItemSection {
  String get value {
    switch (this) {
      case HiddenItemSection.calendar:
        return "calendar";
      case HiddenItemSection.progressWatched:
        return "progress_watched";
      case HiddenItemSection.progressWatchedReset:
        return "progress_watched_reset";
      case HiddenItemSection.progressCollected:
        return "progress_collected";
      case HiddenItemSection.recommendations:
        return "recommendations";
    }
  }
}

enum HiddenItemType { movie, show, season }

extension HiddenItemTypeValue on HiddenItemType {
  String get value {
    switch (this) {
      case HiddenItemType.movie:
        return "movie";
      case HiddenItemType.show:
        return "show";
      case HiddenItemType.season:
        return "season";
    }
  }
}

enum UserLikesType { comments, lists }

extension UserLikesTypeValue on UserLikesType {
  String get value {
    switch (this) {
      case UserLikesType.comments:
        return "comments";
      case UserLikesType.lists:
        return "lists";
    }
  }
}

enum UserCollectionType { movies, shows }

extension UserCollectionTypeValue on UserCollectionType {
  String get value {
    switch (this) {
      case UserCollectionType.movies:
        return "movies";
      case UserCollectionType.shows:
        return "shows";
    }
  }
}

enum WatchedItemType { movies, shows, seasons, episodes }

extension WatchedItemTypeValue on WatchedItemType {
  String get value {
    switch (this) {
      case WatchedItemType.movies:
        return "movies";
      case WatchedItemType.shows:
        return "shows";
      case WatchedItemType.seasons:
        return "seasons";
      case WatchedItemType.episodes:
        return "episodes";
    }
  }
}

enum SortBy { rank, added, released, title }

extension SortByValue on SortBy {
  String get value {
    switch (this) {
      case SortBy.rank:
        return "rank";
      case SortBy.added:
        return "added";
      case SortBy.released:
        return "released";
      case SortBy.title:
        return "title";
    }
  }
}
