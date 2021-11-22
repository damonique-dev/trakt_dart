part of trakt_dart;

enum LanguageType { movies, shows }

extension LanguageTypeValue on LanguageType {
  String get value {
    switch (this) {
      case LanguageType.movies:
        return "movies";
      case LanguageType.shows:
        return "shows";
    }
  }
}

@JsonSerializable(createToJson: false)
class Language {
  final String name, code;

  Language(this.name, this.code);

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  static Language fromJsonModel(Map<String, dynamic> json) =>
      Language.fromJson(json);
}
