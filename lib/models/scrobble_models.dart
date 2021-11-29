part of trakt_dart;

@JsonSerializable(createToJson: false)
class ScrobbleResponse {
  final int id;
  final String action;
  final double progress;
  final CheckInSharing sharing;
  final Movie? movie;
  final Episode? episode;
  final Show? show;

  ScrobbleResponse(this.id, this.action, this.progress, this.sharing,
      this.movie, this.episode, this.show);

  factory ScrobbleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScrobbleResponseFromJson(json);

  static ScrobbleResponse fromJsonModel(Map<String, dynamic> json) =>
      ScrobbleResponse.fromJson(json);
}
