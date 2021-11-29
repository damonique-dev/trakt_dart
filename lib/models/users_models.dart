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
