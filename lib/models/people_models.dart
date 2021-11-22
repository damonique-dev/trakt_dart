part of trakt_dart;

@JsonSerializable(createToJson: false)
class Person {
  // Extended: metadata (minimum data provided)
  final String name;
  final Ids ids;

  // Extended: full
  final String? biography, birthday, death, birthplace, homepage;
  @JsonKey(name: 'social_ids')
  final SocialIds? socialIds;

  Person(this.name, this.ids, this.biography, this.birthday, this.death,
      this.birthplace, this.homepage, this.socialIds);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  static Person fromJsonModel(Map<String, dynamic> json) =>
      Person.fromJson(json);
}

@JsonSerializable(createToJson: false)
class SocialIds {
  final String? twitter, facebook, instagram, wikipedia;

  SocialIds(this.twitter, this.facebook, this.instagram, this.wikipedia);

  factory SocialIds.fromJson(Map<String, dynamic> json) =>
      _$SocialIdsFromJson(json);

  static SocialIds fromJsonModel(Map<String, dynamic> json) =>
      SocialIds.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MoviePeople {
  final List<MovieCharacter>? cast;
  final MovieCrewList? crew;

  MoviePeople(this.cast, this.crew);

  factory MoviePeople.fromJson(Map<String, dynamic> json) =>
      _$MoviePeopleFromJson(json);

  static MoviePeople fromJsonModel(Map<String, dynamic> json) =>
      MoviePeople.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCrewList {
  final List<MovieCrew>? production,
      art,
      sound,
      writing,
      camera,
      directing,
      lighting,
      crew;

  @JsonKey(name: 'costume & make-up')
  final List<MovieCrew>? costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<MovieCrew>? visualEffects;

  MovieCrewList(
      this.production,
      this.art,
      this.sound,
      this.writing,
      this.camera,
      this.directing,
      this.lighting,
      this.crew,
      this.costumeAndMakeUp,
      this.visualEffects);

  factory MovieCrewList.fromJson(Map<String, dynamic> json) =>
      _$MovieCrewListFromJson(json);

  static MovieCrewList fromJsonModel(Map<String, dynamic> json) =>
      MovieCrewList.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCrewList {
  final List<ShowCrew>? production,
      art,
      sound,
      writing,
      camera,
      directing,
      lighting,
      crew;

  @JsonKey(name: 'costume & make-up')
  final List<ShowCrew>? costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<ShowCrew>? visualEffects;

  ShowCrewList(
      this.production,
      this.art,
      this.sound,
      this.writing,
      this.camera,
      this.directing,
      this.lighting,
      this.crew,
      this.costumeAndMakeUp,
      this.visualEffects);

  factory ShowCrewList.fromJson(Map<String, dynamic> json) =>
      _$ShowCrewListFromJson(json);

  static ShowCrewList fromJsonModel(Map<String, dynamic> json) =>
      ShowCrewList.fromJson(json);
}

@JsonSerializable(createToJson: false)
class EpisodeCrewList {
  final List<EpisodeCrew>? production,
      art,
      sound,
      writing,
      camera,
      directing,
      lighting,
      crew;

  @JsonKey(name: 'costume & make-up')
  final List<EpisodeCrew>? costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<EpisodeCrew>? visualEffects;

  EpisodeCrewList(
      this.production,
      this.art,
      this.sound,
      this.writing,
      this.camera,
      this.directing,
      this.lighting,
      this.crew,
      this.costumeAndMakeUp,
      this.visualEffects);

  factory EpisodeCrewList.fromJson(Map<String, dynamic> json) =>
      _$EpisodeCrewListFromJson(json);

  static EpisodeCrewList fromJsonModel(Map<String, dynamic> json) =>
      EpisodeCrewList.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowPeople {
  final List<ShowCharacter>? cast;
  final ShowCrewList? crew;
  @JsonKey(name: 'guest_stars')
  final List<ShowCharacter>? guestStars;

  ShowPeople(this.cast, this.crew, this.guestStars);

  factory ShowPeople.fromJson(Map<String, dynamic> json) =>
      _$ShowPeopleFromJson(json);

  static ShowPeople fromJsonModel(Map<String, dynamic> json) =>
      ShowPeople.fromJson(json);
}

@JsonSerializable(createToJson: false)
class EpisodePeople {
  final List<EpisodeCharacter>? cast;
  final EpisodeCrewList? crew;
  @JsonKey(name: 'guest_stars')
  final List<EpisodeCharacter>? guestStars;

  EpisodePeople(this.cast, this.crew, this.guestStars);

  factory EpisodePeople.fromJson(Map<String, dynamic> json) =>
      _$EpisodePeopleFromJson(json);

  static EpisodePeople fromJsonModel(Map<String, dynamic> json) =>
      EpisodePeople.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCharacter {
  final String character;
  final List<String> characters;
  final Person person;

  MovieCharacter(this.character, this.characters, this.person);

  factory MovieCharacter.fromJson(Map<String, dynamic> json) =>
      _$MovieCharacterFromJson(json);

  static MovieCharacter fromJsonModel(Map<String, dynamic> json) =>
      MovieCharacter.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCrew {
  final String job;
  final List<String> jobs;
  final Person person;

  MovieCrew(this.job, this.jobs, this.person);

  factory MovieCrew.fromJson(Map<String, dynamic> json) =>
      _$MovieCrewFromJson(json);

  static MovieCrew fromJsonModel(Map<String, dynamic> json) =>
      MovieCrew.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCharacter {
  final String character;
  final List<String> characters;
  final Person person;
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  ShowCharacter(
      this.character, this.characters, this.person, this.episodeCount);

  factory ShowCharacter.fromJson(Map<String, dynamic> json) =>
      _$ShowCharacterFromJson(json);

  static ShowCharacter fromJsonModel(Map<String, dynamic> json) =>
      ShowCharacter.fromJson(json);
}

@JsonSerializable(createToJson: false)
class EpisodeCharacter {
  final String character;
  final List<String> characters;
  final Person person;

  EpisodeCharacter(this.character, this.characters, this.person);

  factory EpisodeCharacter.fromJson(Map<String, dynamic> json) =>
      _$EpisodeCharacterFromJson(json);

  static EpisodeCharacter fromJsonModel(Map<String, dynamic> json) =>
      EpisodeCharacter.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCrew {
  final List<String> jobs;
  final Person person;
  @JsonKey(name: 'episode_count')
  final int episodeCount;

  ShowCrew(this.jobs, this.person, this.episodeCount);

  factory ShowCrew.fromJson(Map<String, dynamic> json) =>
      _$ShowCrewFromJson(json);

  static ShowCrew fromJsonModel(Map<String, dynamic> json) =>
      ShowCrew.fromJson(json);
}

@JsonSerializable(createToJson: false)
class EpisodeCrew {
  final List<String> jobs;
  final Person person;

  EpisodeCrew(this.jobs, this.person);

  factory EpisodeCrew.fromJson(Map<String, dynamic> json) =>
      _$EpisodeCrewFromJson(json);

  static EpisodeCrew fromJsonModel(Map<String, dynamic> json) =>
      EpisodeCrew.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PersonMovieCredits {
  final List<MovieCharacterCredits> cast;
  final PersonMovieCrewCreditsList crew;

  PersonMovieCredits(this.cast, this.crew);

  factory PersonMovieCredits.fromJson(Map<String, dynamic> json) =>
      _$PersonMovieCreditsFromJson(json);

  static PersonMovieCredits fromJsonModel(Map<String, dynamic> json) =>
      PersonMovieCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCharacterCredits {
  final List<String> characters;
  final Movie movie;

  MovieCharacterCredits(this.characters, this.movie);

  factory MovieCharacterCredits.fromJson(Map<String, dynamic> json) =>
      _$MovieCharacterCreditsFromJson(json);

  static MovieCharacterCredits fromJsonModel(Map<String, dynamic> json) =>
      MovieCharacterCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class MovieCrewCredits {
  final List<String> jobs;
  final Movie movie;

  MovieCrewCredits(this.jobs, this.movie);

  factory MovieCrewCredits.fromJson(Map<String, dynamic> json) =>
      _$MovieCrewCreditsFromJson(json);

  static MovieCrewCredits fromJsonModel(Map<String, dynamic> json) =>
      MovieCrewCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PersonShowCredits {
  final List<ShowCharacterCredits> cast;
  final PersonShowCrewCreditsList crew;

  PersonShowCredits(this.cast, this.crew);

  factory PersonShowCredits.fromJson(Map<String, dynamic> json) =>
      _$PersonShowCreditsFromJson(json);

  static PersonShowCredits fromJsonModel(Map<String, dynamic> json) =>
      PersonShowCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCharacterCredits {
  final List<String> characters;
  final Show show;

  ShowCharacterCredits(this.characters, this.show);

  factory ShowCharacterCredits.fromJson(Map<String, dynamic> json) =>
      _$ShowCharacterCreditsFromJson(json);

  static ShowCharacterCredits fromJsonModel(Map<String, dynamic> json) =>
      ShowCharacterCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class ShowCrewCredits {
  final List<String> jobs;
  final Show show;

  ShowCrewCredits(this.jobs, this.show);

  factory ShowCrewCredits.fromJson(Map<String, dynamic> json) =>
      _$ShowCrewCreditsFromJson(json);

  static ShowCrewCredits fromJsonModel(Map<String, dynamic> json) =>
      ShowCrewCredits.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PersonMovieCrewCreditsList {
  final List<MovieCrewCredits>? production,
      art,
      sound,
      writing,
      camera,
      directing,
      lighting,
      crew;

  @JsonKey(name: 'costume & make-up')
  final List<MovieCrewCredits>? costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<MovieCrewCredits>? visualEffects;

  PersonMovieCrewCreditsList(
      this.production,
      this.art,
      this.sound,
      this.writing,
      this.camera,
      this.directing,
      this.lighting,
      this.crew,
      this.costumeAndMakeUp,
      this.visualEffects);

  factory PersonMovieCrewCreditsList.fromJson(Map<String, dynamic> json) =>
      _$PersonMovieCrewCreditsListFromJson(json);

  static PersonMovieCrewCreditsList fromJsonModel(Map<String, dynamic> json) =>
      PersonMovieCrewCreditsList.fromJson(json);
}

@JsonSerializable(createToJson: false)
class PersonShowCrewCreditsList {
  final List<ShowCrewCredits>? production,
      art,
      sound,
      writing,
      camera,
      directing,
      lighting,
      crew;

  @JsonKey(name: 'costume & make-up')
  final List<ShowCrewCredits>? costumeAndMakeUp;

  @JsonKey(name: 'visual effects')
  final List<ShowCrewCredits>? visualEffects;

  PersonShowCrewCreditsList(
      this.production,
      this.art,
      this.sound,
      this.writing,
      this.camera,
      this.directing,
      this.lighting,
      this.crew,
      this.costumeAndMakeUp,
      this.visualEffects);

  factory PersonShowCrewCreditsList.fromJson(Map<String, dynamic> json) =>
      _$PersonShowCrewCreditsListFromJson(json);

  static PersonShowCrewCreditsList fromJsonModel(Map<String, dynamic> json) =>
      PersonShowCrewCreditsList.fromJson(json);
}
