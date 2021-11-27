part of trakt_dart;

@JsonSerializable(createToJson: false)
class MyCalendarShow {
  @JsonKey(name: 'first_aired')
  final String firstAired;
  final Episode episode;
  final Show show;

  MyCalendarShow(this.firstAired, this.episode, this.show);

  factory MyCalendarShow.fromJson(Map<String, dynamic> json) =>
      _$MyCalendarShowFromJson(json);

  static MyCalendarShow fromJsonModel(Map<String, dynamic> json) =>
      MyCalendarShow.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MyCalendarMovie {
  final String released;
  final Movie movie;

  MyCalendarMovie(this.released, this.movie);

  factory MyCalendarMovie.fromJson(Map<String, dynamic> json) =>
      _$MyCalendarMovieFromJson(json);

  static MyCalendarMovie fromJsonModel(Map<String, dynamic> json) =>
      MyCalendarMovie.fromJson(json);
}
