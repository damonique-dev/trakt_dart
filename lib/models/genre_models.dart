part of trakt_dart;

enum GenreType { movies, shows }

extension GenreTypeValue on GenreType {
  String get value {
    switch (this) {
      case GenreType.movies:
        return "movies";
      case GenreType.shows:
        return "shows";
    }
  }
}

@JsonSerializable(createToJson: false)
class Genre {
  final String name, slug;

  Genre(this.name, this.slug);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  static Genre fromJsonModel(Map<String, dynamic> json) => Genre.fromJson(json);
}
