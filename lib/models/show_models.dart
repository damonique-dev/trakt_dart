import 'package:json_annotation/json_annotation.dart';
import 'package:trakt_dart/models/common_models.dart';
import 'package:trakt_dart/models/people_models.dart';

part 'user_models.g.dart';

@JsonSerializable(createToJson: false)
class Show {
  // Extended: metadata (minimum data provided)
  final String title;
  final int? year;
  final Ids ids;

  // Extended: full
  final String? overview, certification, network, country, trailer, homepage, status, updated_at, language;
  final int? runtime, votes;
  final AirTime? airs;
  final double? rating;
  final List<String> genres;

  @JsonKey(name: 'first_aired')
  final String? firstAired;

  @JsonKey(name: 'comment_count')
  final String? commentCount;

  @JsonKey(name: 'available_translations')
  final List<String>? availableTranslations;

  @JsonKey(name: 'aired_episodes')
  final int? airedEpisodes;

  Show(this.title, this.year, this.ids, this.overview, this.certification, this.network, this.country, this.trailer, this.homepage, this.status, this.updated_at, this.language, this.runtime, this.votes, this.airs, this.rating, this.genres, this.firstAired, this.commentCount, this.availableTranslations, this.airedEpisodes);

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  static Show fromJsonModel(Map<String, dynamic> json) => Show.fromJson(json);
}

@JsonSerializable(createToJson: false)
class AirTime {
  final String day, time, timezone;

  AirTime(this.day, this.time, this.timezone);

  factory AirTime.fromJson(Map<String, dynamic> json) => _$AirTimeFromJson(json);

  static AirTime fromJsonModel(Map<String, dynamic> json) => AirTime.fromJson(json);
}

@JsonSerializable(createToJson: false)
class TrendingShow {
  final int watchers;
  final Show show;

  TrendingShow(this.watchers, this.show);

  factory TrendingShow.fromJson(Map<String, dynamic> json) => _$TrendingShowFromJson(json);

  static TrendingShow fromJsonModel(Map<String, dynamic> json) => TrendingShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class RecommendedShow {
  @JsonKey(name: 'user_count')
  final int userCount;
  final Show show;

  RecommendedShow(this.userCount, this.show);

  factory RecommendedShow.fromJson(Map<String, dynamic> json) => _$RecommendedShowFromJson(json);

  static RecommendedShow fromJsonModel(Map<String, dynamic> json) => RecommendedShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PlayedWatchedCollectedShow {
  @JsonKey(name: 'watcher_count')
  final int watcherCount;
  @JsonKey(name: 'play_count')
  final int playCount;
  @JsonKey(name: 'collected_count')
  final int collectedCount;
  final Show show;

  PlayedWatchedCollectedShow(this.watcherCount, this.playCount, this.collectedCount, this.show);

  factory PlayedWatchedCollectedShow.fromJson(Map<String, dynamic> json) => _$PlayedWatchedCollectedShowFromJson(json);

  static PlayedWatchedCollectedShow fromJsonModel(Map<String, dynamic> json) => PlayedWatchedCollectedShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class AnticipatedShow {
  @JsonKey(name: 'list_count')
  final int listCount;
  final Show show;

  AnticipatedShow(this.listCount, this.show);

  factory AnticipatedShow.fromJson(Map<String, dynamic> json) => _$AnticipatedShowFromJson(json);

  static AnticipatedShow fromJsonModel(Map<String, dynamic> json) => AnticipatedShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdatedShow {
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  final Show show;

  UpdatedShow(this.updatedAt, this.show);

  factory UpdatedShow.fromJson(Map<String, dynamic> json) => _$UpdatedShowFromJson(json);

  static UpdatedShow fromJsonModel(Map<String, dynamic> json) => UpdatedShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCertification {
  final String certification, country;

  ShowCertification(this.certification, this.country);

  factory ShowCertification.fromJson(Map<String, dynamic> json) => _$ShowCertificationFromJson(json);

  static ShowCertification fromJsonModel(Map<String, dynamic> json) => ShowCertification.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowTranslation {
  final String title, overview, language;

  ShowTranslation(this.title, this.overview, this.language);

  factory ShowTranslation.fromJson(Map<String, dynamic> json) => _$ShowTranslationFromJson(json);

  static ShowTranslation fromJsonModel(Map<String, dynamic> json) => ShowTranslation.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowPeople {
  final List<ShowCharacter> cast;
  final List<ShowCrew> crew;

  ShowPeople(this.cast, this.crew);

  factory ShowPeople.fromJson(Map<String, dynamic> json) => _$ShowPeopleFromJson(json);

  static ShowPeople fromJsonModel(Map<String, dynamic> json) => ShowPeople.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowStats {
  final int watchers, plays, collectors, comments, lists, votes, recommended;
  @JsonKey(name: 'collected_episodes')
  final int collectedEpisodes;

  ShowStats(this.watchers, this.plays, this.collectors, this.comments, this.lists, this.votes, this.recommended, this.collectedEpisodes);

  factory ShowStats.fromJson(Map<String, dynamic> json) => _$ShowStatsFromJson(json);

  static ShowStats fromJsonModel(Map<String, dynamic> json) => ShowStats.fromJson(json);
}
