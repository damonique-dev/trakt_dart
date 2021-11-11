import 'package:json_annotation/json_annotation.dart';
import 'package:trakt_dart/models/common_models.dart';

part 'users_models.g.dart';

@JsonSerializable(createToJson: false)
class User {
  // Extended: metadata (minimum data provided)
  final String username, name;
  final bool private, vip;
  final Ids ids;

  @JsonKey(name: 'vip_ep')
  final bool vipEp;

  // Extended: full
  final String? location, about, gender;
  final int? age;
  final Images? images;

  @JsonKey(name: 'joined_at')
  final String? joinedAt;

  User(this.username, this.name, this.private, this.vip, this.vipEp, this.ids, this.location, this.about, this.gender, this.age, this.images, this.joinedAt);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserStats {
  final int rating;

  @JsonKey(name: 'play_count')
  final int playCount;

  @JsonKey(name: 'completed_count')
  final int completedCount;

  UserStats(this.rating, this.playCount, this.completedCount);

  factory UserStats.fromJson(Map<String, dynamic> json) => _$UserStatsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Images {
  final Avatar avatar;

  Images(this.avatar);

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@JsonSerializable(createToJson: false)
class Avatar {
  final String full;

  Avatar(this.full);

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
