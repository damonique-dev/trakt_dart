part of trakt_dart;

@JsonSerializable(createToJson: false)
class Genre {
  final String name, slug;

  Genre(this.name, this.slug);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  static Genre fromJsonModel(Map<String, dynamic> json) => Genre.fromJson(json);
}
