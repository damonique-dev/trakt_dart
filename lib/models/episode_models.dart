import 'package:json_annotation/json_annotation.dart';
import 'package:trakt_dart/models/common_models.dart';

part 'episode_models.g.dart';

@JsonSerializable(createToJson: false)
class Episode {
  // Extended: metadata (minimum data provided)
  final int season;
  final int number;
  final String title;
  final Ids ids;

  // Extended: full

  Episode(this.season, this.number, this.title, this.ids);

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

  static Episode fromJsonModel(Map<String, dynamic> json) => Episode.fromJson(json);
}
