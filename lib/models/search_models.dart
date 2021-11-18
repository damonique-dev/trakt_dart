part of trakt_dart;

enum SearchType { movie, show, episode, person, list }

extension SearchTypeValue on SearchType {
  String get value {
    switch (this) {
      case SearchType.movie:
        return "movie";
      case SearchType.show:
        return "show";
      case SearchType.episode:
        return "episode";
      case SearchType.person:
        return "person";
      case SearchType.list:
        return "list";
    }
  }
}

enum SearchField {
  title,
  tagline,
  overview,
  people,
  translations,
  aliases,
  name,
  biography,
  description
}

extension SearchFieldValue on SearchField {
  String get value {
    switch (this) {
      case SearchField.title:
        return "title";
      case SearchField.tagline:
        return "tagline";
      case SearchField.overview:
        return "overview";
      case SearchField.people:
        return "people";
      case SearchField.translations:
        return "translations";
      case SearchField.aliases:
        return "aliases";
      case SearchField.name:
        return "name";
      case SearchField.biography:
        return "biography";
      case SearchField.description:
        return "description";
    }
  }
}

enum SearchIdType { trakt, imdb, tmdb, tvdb }

extension SearchIdTypeValue on SearchIdType {
  String get value {
    switch (this) {
      case SearchIdType.trakt:
        return "trakt";
      case SearchIdType.imdb:
        return "imdb";
      case SearchIdType.tmdb:
        return "tmdb";
      case SearchIdType.tvdb:
        return "tvdb";
    }
  }
}

@JsonSerializable(createToJson: false)
class SearchResult {
  final String type;
  final double score;
  final Movie? movie;
  final Show? show;
  final Episode? episode;
  final TraktList? list;
  final Person? person;

  SearchResult(this.type, this.score, this.movie, this.show, this.episode,
      this.list, this.person);

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  static SearchResult fromJsonModel(Map<String, dynamic> json) =>
      SearchResult.fromJson(json);
}
