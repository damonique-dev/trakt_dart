part of trakt_dart;

@JsonSerializable(createToJson: false)
class SyncActivity {
  final String all;
  final ActivityItem movies,
      episodes,
      shows,
      seasons,
      comments,
      lists,
      watchlist,
      recommendations,
      account;

  SyncActivity(
      this.all,
      this.movies,
      this.episodes,
      this.shows,
      this.seasons,
      this.comments,
      this.lists,
      this.watchlist,
      this.recommendations,
      this.account);

  factory SyncActivity.fromJson(Map<String, dynamic> json) =>
      _$SyncActivityFromJson(json);

  static SyncActivity fromJsonModel(Map<String, dynamic> json) =>
      SyncActivity.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ActivityItem {
  // Available for Movies, Episodes
  @JsonKey(name: 'watched_at')
  final String? watchedAt;

  // Available for Movies, Episodes
  @JsonKey(name: 'collected_at')
  final String? collectedAt;

  // Available for Movies, Episodes, Shows, Seasons
  @JsonKey(name: 'rated_at')
  final String? ratedAt;

  // Available for Movies, Episodes, Shows, Seasons
  @JsonKey(name: 'watchlisted_at')
  final String? watchlistedAt;

  // Available for Movies, Shows
  @JsonKey(name: 'recommendations_at')
  final String? recommendationsAt;

  // Available for Movies, Episodes, Shows, Seasons, Lists
  @JsonKey(name: 'commented_at')
  final String? commentedAt;

  // Available for Movies, Episodes
  @JsonKey(name: 'paused_at')
  final String? pausedAt;

  // Available for Movies, Shows, Seasons
  @JsonKey(name: 'hidden_at')
  final String? hiddenAt;

  // Available for Comments, Lists
  @JsonKey(name: 'liked_at')
  final String? likedAt;

  // Available for Lists, Watchlist, Recommendations
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  // Available for Account
  @JsonKey(name: 'settings_at')
  final String? settingsAt;

  // Available for Account
  @JsonKey(name: 'followed_at')
  final String? followedAt;

  // Available for Account
  @JsonKey(name: 'following_at')
  final String? followingAt;

  // Available for Account
  @JsonKey(name: 'pending_at')
  final String? pendingAt;

  ActivityItem(
      this.watchedAt,
      this.collectedAt,
      this.ratedAt,
      this.watchlistedAt,
      this.recommendationsAt,
      this.commentedAt,
      this.pausedAt,
      this.hiddenAt,
      this.likedAt,
      this.updatedAt,
      this.settingsAt,
      this.followedAt,
      this.followingAt,
      this.pendingAt);

  factory ActivityItem.fromJson(Map<String, dynamic> json) =>
      _$ActivityItemFromJson(json);

  static ActivityItem fromJsonModel(Map<String, dynamic> json) =>
      ActivityItem.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PlaybackProgress {
  final int id;
  final double progress;
  final String type;
  final Movie? movie;
  final Episode? episode;
  final Show? show;

  @JsonKey(name: 'paused_at')
  final String pausedAt;

  PlaybackProgress(this.id, this.progress, this.type, this.movie, this.episode,
      this.show, this.pausedAt);

  factory PlaybackProgress.fromJson(Map<String, dynamic> json) =>
      _$PlaybackProgressFromJson(json);

  static PlaybackProgress fromJsonModel(Map<String, dynamic> json) =>
      PlaybackProgress.fromJson(json);
}

@JsonSerializable(createToJson: false)
class AddToSyncResponse {
  final AddToSyncResult? added, updated, existing;
  @JsonKey(name: 'not_found')
  final UpdatedSyncNotFound notFound;

  AddToSyncResponse(this.added, this.updated, this.existing, this.notFound);

  factory AddToSyncResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToSyncResponseFromJson(json);

  static AddToSyncResponse fromJsonModel(Map<String, dynamic> json) =>
      AddToSyncResponse.fromJson(json);
}

@JsonSerializable(createToJson: false)
class AddToSyncResult {
  final int? movies, shows, episodes;

  AddToSyncResult(this.movies, this.episodes, this.shows);

  factory AddToSyncResult.fromJson(Map<String, dynamic> json) =>
      _$AddToSyncResultFromJson(json);

  static AddToSyncResult fromJsonModel(Map<String, dynamic> json) =>
      AddToSyncResult.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdatedSyncNotFound {
  final List<Map<String, dynamic>>? movies, shows, seasons, episodes;

  UpdatedSyncNotFound(this.movies, this.shows, this.seasons, this.episodes);

  factory UpdatedSyncNotFound.fromJson(Map<String, dynamic> json) =>
      _$UpdatedSyncNotFoundFromJson(json);

  static UpdatedSyncNotFound fromJsonModel(Map<String, dynamic> json) =>
      UpdatedSyncNotFound.fromJson(json);
}

@JsonSerializable(createToJson: false)
class RemoveFromSyncResponse {
  final UpdatedSyncMetadata deleted;

  @JsonKey(name: 'not_found')
  final UpdatedSyncNotFound notFound;

  RemoveFromSyncResponse(this.deleted, this.notFound);

  factory RemoveFromSyncResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveFromSyncResponseFromJson(json);

  static RemoveFromSyncResponse fromJsonModel(Map<String, dynamic> json) =>
      RemoveFromSyncResponse.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdatedSyncMetadata {
  final int? movies, shows, seasons, episodes;

  UpdatedSyncMetadata(this.movies, this.shows, this.seasons, this.episodes);

  factory UpdatedSyncMetadata.fromJson(Map<String, dynamic> json) =>
      _$UpdatedSyncMetadataFromJson(json);

  static UpdatedSyncMetadata fromJsonModel(Map<String, dynamic> json) =>
      UpdatedSyncMetadata.fromJson(json);
}

class CollectionItemPostData {
  /// UTC datetime when the item was collected. Set to released to automatically use the inital release date.
  final String? collectedAt;

  final CollectionItemMediaType? mediaType;
  final CollectionItemResolution? resolution;
  final CollectionItemAudio? audio;

  /// Set to 1.0, 2.0, 2.1, 3.0, 3.1, 4.0, 4.1, 5.0, 5.1, 5.1.2, 5.1.4, 6.1, 7.1, 7.1.2, 7.1.4, 9.1, or 10.1
  final String? audioChannels;

  /// Set true if in 3D.
  final bool? is3d;

  CollectionItemPostData(
      {this.collectedAt,
      this.mediaType,
      this.resolution,
      this.audio,
      this.audioChannels,
      this.is3d});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (collectedAt != null) {
      map["collected_at"] = collectedAt!;
    }
    if (mediaType != null) {
      map["media_type"] = mediaType!.value;
    }
    if (resolution != null) {
      map["resolution"] = resolution!.value;
    }
    if (audio != null) {
      map["audio"] = audio!.value;
    }
    if (audioChannels != null) {
      map["audio_channels"] = audioChannels!;
    }
    if (is3d != null) {
      map["3d"] = is3d!;
    }
    return map;
  }
}

enum PlaybackProgressItemType { movies, episodes }

extension PlaybackProgressItemTypeValue on PlaybackProgressItemType {
  String get value {
    switch (this) {
      case PlaybackProgressItemType.movies:
        return "movies";
      case PlaybackProgressItemType.episodes:
        return "episodes";
    }
  }
}

enum CollectionItemMediaType {
  digital,
  bluray,
  hddvd,
  dvd,
  vcd,
  vhs,
  betamax,
  laserdisc
}

extension CollectionItemMediaTypeValue on CollectionItemMediaType {
  String get value {
    switch (this) {
      case CollectionItemMediaType.digital:
        return "digital";
      case CollectionItemMediaType.bluray:
        return "bluray";
      case CollectionItemMediaType.hddvd:
        return "hddvd";
      case CollectionItemMediaType.dvd:
        return "dvd";
      case CollectionItemMediaType.vcd:
        return "vcd";
      case CollectionItemMediaType.vhs:
        return "vhs";
      case CollectionItemMediaType.betamax:
        return "betamax";
      case CollectionItemMediaType.laserdisc:
        return "laserdisc";
    }
  }
}

enum CollectionItemResolution {
  uhd4k,
  hd1080p,
  hd1080i,
  hd720p,
  sd480p,
  sd480i,
  sd576p,
  sd576i
}

extension CollectionItemResolutionValue on CollectionItemResolution {
  String get value {
    switch (this) {
      case CollectionItemResolution.uhd4k:
        return "uhd_4k";
      case CollectionItemResolution.hd1080p:
        return "hd_1080p";
      case CollectionItemResolution.hd1080i:
        return "hd_1080i";
      case CollectionItemResolution.hd720p:
        return "hd_720p";
      case CollectionItemResolution.sd480p:
        return "sd_480p";
      case CollectionItemResolution.sd480i:
        return "sd_480i";
      case CollectionItemResolution.sd576p:
        return "sd_576p";
      case CollectionItemResolution.sd576i:
        return "sd_576i";
    }
  }
}

enum CollectionItemHdr { dolbyVision, hdr10, hdr10Plus, hlg }

extension CollectionItemHdrValue on CollectionItemHdr {
  String get value {
    switch (this) {
      case CollectionItemHdr.dolbyVision:
        return "dolby_vision";
      case CollectionItemHdr.hdr10:
        return "hdr10";
      case CollectionItemHdr.hdr10Plus:
        return "hdr10_plus";
      case CollectionItemHdr.hlg:
        return "hlg";
    }
  }
}

enum CollectionItemAudio {
  dolbyDigital,
  dolbyDigitalPlus,
  dolbyDigitalPlusAtmos,
  dolbyTruehd,
  dolbyAtmos,
  dolbyPrologic,
  dts,
  dtsMa,
  dtsHr,
  dtsX,
  auro3d,
  mp3,
  mp2,
  aac,
  lpcm,
  ogg,
  oggOpus,
  wma,
  flac
}

extension CollectionItemAudioValue on CollectionItemAudio {
  String get value {
    switch (this) {
      case CollectionItemAudio.dolbyDigital:
        return "dolby_digital";
      case CollectionItemAudio.dolbyDigitalPlus:
        return "dolby_digital_plus";
      case CollectionItemAudio.dolbyDigitalPlusAtmos:
        return "dolby_digital_plus_atmos";
      case CollectionItemAudio.dolbyTruehd:
        return "dolby_truehd";
      case CollectionItemAudio.dolbyAtmos:
        return "dolby_atmos";
      case CollectionItemAudio.dolbyPrologic:
        return "dolby_prologic";
      case CollectionItemAudio.dts:
        return "dts";
      case CollectionItemAudio.dtsMa:
        return "dts_ma";
      case CollectionItemAudio.dtsHr:
        return "dts_hr";
      case CollectionItemAudio.dtsX:
        return "dts_x";
      case CollectionItemAudio.auro3d:
        return "auro_3d";
      case CollectionItemAudio.mp3:
        return "mp3";
      case CollectionItemAudio.mp2:
        return "mp2";
      case CollectionItemAudio.aac:
        return "aac";
      case CollectionItemAudio.lpcm:
        return "lpcm";
      case CollectionItemAudio.ogg:
        return "ogg";
      case CollectionItemAudio.oggOpus:
        return "ogg_opus";
      case CollectionItemAudio.wma:
        return "wma";
      case CollectionItemAudio.flac:
        return "flac";
    }
  }
}
