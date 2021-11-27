// GENERATED CODE - DO NOT MODIFY BY HAND

part of trakt_dart;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenResponse _$AccessTokenResponseFromJson(Map<String, dynamic> json) =>
    AccessTokenResponse(
      json['access_token'] as String,
      json['token_type'] as String,
      json['expires_in'] as int,
      json['refresh_token'] as String,
      json['scope'] as String,
      json['created_at'] as int,
    );

MyCalendarShow _$MyCalendarShowFromJson(Map<String, dynamic> json) =>
    MyCalendarShow(
      json['first_aired'] as String,
      Episode.fromJson(json['episode'] as Map<String, dynamic>),
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

MyCalendarMovie _$MyCalendarMovieFromJson(Map<String, dynamic> json) =>
    MyCalendarMovie(
      json['released'] as String,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

CertificationsResult _$CertificationsResultFromJson(
        Map<String, dynamic> json) =>
    CertificationsResult(
      (json['us'] as List<dynamic>)
          .map((e) => Certification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Certification _$CertificationFromJson(Map<String, dynamic> json) =>
    Certification(
      json['name'] as String,
      json['slug'] as String,
      json['description'] as String,
    );

MovieShowMetadata _$MovieShowMetadataFromJson(Map<String, dynamic> json) =>
    MovieShowMetadata(
      json['title'] as String,
      json['year'] as int,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
    );

Ids _$IdsFromJson(Map<String, dynamic> json) => Ids(
      json['trakt'] as int?,
      json['slug'] as String?,
      json['tvdb'] as int?,
      json['imdb'] as String?,
      json['tmdb'] as int?,
    );

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      json['id'] as int,
      json['replies'] as int,
      json['likes'] as int,
      json['comment'] as String,
      json['spoiler'] as bool,
      json['review'] as bool,
      json['parent_id'] as int,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['user_rating'] as int?,
      UserStats.fromJson(json['user_stats'] as Map<String, dynamic>),
      User.fromJson(json['user'] as Map<String, dynamic>),
    );

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      (json['rating'] as num).toDouble(),
      json['votes'] as int,
      Map<String, int>.from(json['distribution'] as Map),
    );

MovieShowAlias _$MovieShowAliasFromJson(Map<String, dynamic> json) =>
    MovieShowAlias(
      json['title'] as String,
      json['country'] as String,
    );

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['name'] as String,
      json['code'] as String,
    );

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      json['season'] as int,
      json['number'] as int,
      json['title'] as String?,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['overview'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['votes'] as int?,
      json['runtime'] as int?,
      json['comment_count'] as int?,
      json['first_aired'] as String?,
      json['updated_at'] as String?,
      (json['available_translations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

EpisodeStats _$EpisodeStatsFromJson(Map<String, dynamic> json) => EpisodeStats(
      json['watchers'] as int,
      json['plays'] as int,
      json['collectors'] as int,
      json['comments'] as int,
      json['lists'] as int,
      json['votes'] as int,
    );

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      json['name'] as String,
      json['slug'] as String,
    );

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      json['name'] as String,
      json['code'] as String,
    );

TraktList _$TraktListFromJson(Map<String, dynamic> json) => TraktList(
      json['name'] as String,
      json['description'] as String,
      json['privacy'] as String,
      json['likes'] as int,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['display_numbers'] as bool,
      json['allow_comments'] as bool,
      json['sort_by'] as String,
      json['sort_how'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['item_count'] as int?,
      json['comment_count'] as int,
    );

TrendingPopularList _$TrendingPopularListFromJson(Map<String, dynamic> json) =>
    TrendingPopularList(
      TraktList.fromJson(json['list'] as Map<String, dynamic>),
      json['like_count'] as int,
      json['comment_count'] as int,
    );

ListLikes _$ListLikesFromJson(Map<String, dynamic> json) => ListLikes(
      json['liked_at'] as String,
      User.fromJson(json['user'] as Map<String, dynamic>),
    );

ListItem _$ListItemFromJson(Map<String, dynamic> json) => ListItem(
      json['rank'] as int,
      json['id'] as int,
      json['listed_at'] as String,
      json['notes'] as String?,
      json['type'] as String,
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
      json['season'] == null
          ? null
          : Season.fromJson(json['season'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
    );

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['title'] as String,
      json['overview'] as String?,
      json['country'] as String?,
      json['language'] as String?,
      json['certification'] as String?,
      json['year'] as int?,
      json['runtime'] as int?,
      json['votes'] as int?,
      json['comment_count'] as int?,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['tagline'] as String?,
      json['trailer'] as String?,
      json['homepage'] as String?,
      json['status'] as String?,
      (json['rating'] as num?)?.toDouble(),
      (json['available_translations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['released'] as String?,
      json['updatedAt'] as String?,
    );

TrendingMovie _$TrendingMovieFromJson(Map<String, dynamic> json) =>
    TrendingMovie(
      json['watchers'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

RecommendedMovie _$RecommendedMovieFromJson(Map<String, dynamic> json) =>
    RecommendedMovie(
      json['user_count'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

PlayedWatchedCollectedMovie _$PlayedWatchedCollectedMovieFromJson(
        Map<String, dynamic> json) =>
    PlayedWatchedCollectedMovie(
      json['watcher_count'] as int,
      json['play_count'] as int,
      json['collected_count'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

AnticipatedMovie _$AnticipatedMovieFromJson(Map<String, dynamic> json) =>
    AnticipatedMovie(
      json['list_count'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

BoxOfficeMovie _$BoxOfficeMovieFromJson(Map<String, dynamic> json) =>
    BoxOfficeMovie(
      json['revenue'] as int,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

UpdatedMovie _$UpdatedMovieFromJson(Map<String, dynamic> json) => UpdatedMovie(
      json['updated_at'] as String,
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

MovieRelease _$MovieReleaseFromJson(Map<String, dynamic> json) => MovieRelease(
      json['country'] as String?,
      json['certification'] as String?,
      json['release_date'] as String?,
      json['release_type'] as String?,
      json['note'] as String?,
    );

MovieTranslation _$MovieTranslationFromJson(Map<String, dynamic> json) =>
    MovieTranslation(
      json['title'] as String,
      json['overview'] as String,
      json['tagline'] as String,
      json['language'] as String,
    );

MovieStats _$MovieStatsFromJson(Map<String, dynamic> json) => MovieStats(
      json['watchers'] as int,
      json['plays'] as int,
      json['collectors'] as int,
      json['comments'] as int,
      json['lists'] as int,
      json['votes'] as int,
      json['recommended'] as int,
    );

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
      json['name'] as String,
    );

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      json['name'] as String,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['biography'] as String?,
      json['birthday'] as String?,
      json['death'] as String?,
      json['birthplace'] as String?,
      json['homepage'] as String?,
      json['social_ids'] == null
          ? null
          : SocialIds.fromJson(json['social_ids'] as Map<String, dynamic>),
    );

SocialIds _$SocialIdsFromJson(Map<String, dynamic> json) => SocialIds(
      json['twitter'] as String?,
      json['facebook'] as String?,
      json['instagram'] as String?,
      json['wikipedia'] as String?,
    );

MoviePeople _$MoviePeopleFromJson(Map<String, dynamic> json) => MoviePeople(
      (json['cast'] as List<dynamic>?)
          ?.map((e) => MovieCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['crew'] == null
          ? null
          : MovieCrewList.fromJson(json['crew'] as Map<String, dynamic>),
    );

MovieCrewList _$MovieCrewListFromJson(Map<String, dynamic> json) =>
    MovieCrewList(
      (json['production'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['art'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sound'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['writing'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['camera'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['directing'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lighting'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['costume & make-up'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['visual effects'] as List<dynamic>?)
          ?.map((e) => MovieCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ShowCrewList _$ShowCrewListFromJson(Map<String, dynamic> json) => ShowCrewList(
      (json['production'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['art'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sound'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['writing'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['camera'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['directing'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lighting'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['costume & make-up'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['visual effects'] as List<dynamic>?)
          ?.map((e) => ShowCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

EpisodeCrewList _$EpisodeCrewListFromJson(Map<String, dynamic> json) =>
    EpisodeCrewList(
      (json['production'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['art'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sound'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['writing'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['camera'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['directing'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lighting'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['costume & make-up'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['visual effects'] as List<dynamic>?)
          ?.map((e) => EpisodeCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ShowPeople _$ShowPeopleFromJson(Map<String, dynamic> json) => ShowPeople(
      (json['cast'] as List<dynamic>?)
          ?.map((e) => ShowCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['crew'] == null
          ? null
          : ShowCrewList.fromJson(json['crew'] as Map<String, dynamic>),
      (json['guest_stars'] as List<dynamic>?)
          ?.map((e) => ShowCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

EpisodePeople _$EpisodePeopleFromJson(Map<String, dynamic> json) =>
    EpisodePeople(
      (json['cast'] as List<dynamic>?)
          ?.map((e) => EpisodeCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['crew'] == null
          ? null
          : EpisodeCrewList.fromJson(json['crew'] as Map<String, dynamic>),
      (json['guest_stars'] as List<dynamic>?)
          ?.map((e) => EpisodeCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MovieCharacter _$MovieCharacterFromJson(Map<String, dynamic> json) =>
    MovieCharacter(
      json['character'] as String,
      (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
      Person.fromJson(json['person'] as Map<String, dynamic>),
    );

MovieCrew _$MovieCrewFromJson(Map<String, dynamic> json) => MovieCrew(
      json['job'] as String,
      (json['jobs'] as List<dynamic>).map((e) => e as String).toList(),
      Person.fromJson(json['person'] as Map<String, dynamic>),
    );

ShowCharacter _$ShowCharacterFromJson(Map<String, dynamic> json) =>
    ShowCharacter(
      json['character'] as String,
      (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
      Person.fromJson(json['person'] as Map<String, dynamic>),
      json['episode_count'] as int,
    );

EpisodeCharacter _$EpisodeCharacterFromJson(Map<String, dynamic> json) =>
    EpisodeCharacter(
      json['character'] as String,
      (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
      Person.fromJson(json['person'] as Map<String, dynamic>),
    );

ShowCrew _$ShowCrewFromJson(Map<String, dynamic> json) => ShowCrew(
      (json['jobs'] as List<dynamic>).map((e) => e as String).toList(),
      Person.fromJson(json['person'] as Map<String, dynamic>),
      json['episode_count'] as int,
    );

EpisodeCrew _$EpisodeCrewFromJson(Map<String, dynamic> json) => EpisodeCrew(
      (json['jobs'] as List<dynamic>).map((e) => e as String).toList(),
      Person.fromJson(json['person'] as Map<String, dynamic>),
    );

PersonMovieCredits _$PersonMovieCreditsFromJson(Map<String, dynamic> json) =>
    PersonMovieCredits(
      (json['cast'] as List<dynamic>)
          .map((e) => MovieCharacterCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      PersonMovieCrewCreditsList.fromJson(json['crew'] as Map<String, dynamic>),
    );

MovieCharacterCredits _$MovieCharacterCreditsFromJson(
        Map<String, dynamic> json) =>
    MovieCharacterCredits(
      (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

MovieCrewCredits _$MovieCrewCreditsFromJson(Map<String, dynamic> json) =>
    MovieCrewCredits(
      (json['jobs'] as List<dynamic>).map((e) => e as String).toList(),
      Movie.fromJson(json['movie'] as Map<String, dynamic>),
    );

PersonShowCredits _$PersonShowCreditsFromJson(Map<String, dynamic> json) =>
    PersonShowCredits(
      (json['cast'] as List<dynamic>)
          .map((e) => ShowCharacterCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      PersonShowCrewCreditsList.fromJson(json['crew'] as Map<String, dynamic>),
    );

ShowCharacterCredits _$ShowCharacterCreditsFromJson(
        Map<String, dynamic> json) =>
    ShowCharacterCredits(
      (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

ShowCrewCredits _$ShowCrewCreditsFromJson(Map<String, dynamic> json) =>
    ShowCrewCredits(
      (json['jobs'] as List<dynamic>).map((e) => e as String).toList(),
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

PersonMovieCrewCreditsList _$PersonMovieCrewCreditsListFromJson(
        Map<String, dynamic> json) =>
    PersonMovieCrewCreditsList(
      (json['production'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['art'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sound'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['writing'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['camera'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['directing'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lighting'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['costume & make-up'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['visual effects'] as List<dynamic>?)
          ?.map((e) => MovieCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PersonShowCrewCreditsList _$PersonShowCrewCreditsListFromJson(
        Map<String, dynamic> json) =>
    PersonShowCrewCreditsList(
      (json['production'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['art'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['sound'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['writing'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['camera'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['directing'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lighting'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['costume & make-up'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['visual effects'] as List<dynamic>?)
          ?.map((e) => ShowCrewCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      json['type'] as String,
      (json['score'] as num).toDouble(),
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['list'] == null
          ? null
          : TraktList.fromJson(json['list'] as Map<String, dynamic>),
      json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
    );

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      json['number'] as int,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['title'] as String?,
      json['overview'] as String?,
      json['network'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['votes'] as int?,
      json['episode_count'] as int?,
      json['aired_episodes'] as int?,
      json['first_aired'] as String?,
      json['updated_at'] as String?,
    );

SeasonStats _$SeasonStatsFromJson(Map<String, dynamic> json) => SeasonStats(
      json['watchers'] as int,
      json['plays'] as int,
      json['collectors'] as int,
      json['comments'] as int,
      json['lists'] as int,
      json['votes'] as int,
      json['collected_episodes'] as int,
    );

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
      json['title'] as String,
      json['year'] as int?,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['overview'] as String?,
      json['certification'] as String?,
      json['network'] as String?,
      json['country'] as String?,
      json['trailer'] as String?,
      json['homepage'] as String?,
      json['status'] as String?,
      json['updated_at'] as String?,
      json['language'] as String?,
      json['runtime'] as int?,
      json['votes'] as int?,
      json['airs'] == null
          ? null
          : AirTime.fromJson(json['airs'] as Map<String, dynamic>),
      (json['rating'] as num?)?.toDouble(),
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['first_aired'] as String?,
      json['comment_count'] as int?,
      (json['available_translations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['aired_episodes'] as int?,
    );

AirTime _$AirTimeFromJson(Map<String, dynamic> json) => AirTime(
      json['day'] as String?,
      json['time'] as String?,
      json['timezone'] as String?,
    );

TrendingShow _$TrendingShowFromJson(Map<String, dynamic> json) => TrendingShow(
      json['watchers'] as int,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

RecommendedShow _$RecommendedShowFromJson(Map<String, dynamic> json) =>
    RecommendedShow(
      json['user_count'] as int,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

PlayedWatchedCollectedShow _$PlayedWatchedCollectedShowFromJson(
        Map<String, dynamic> json) =>
    PlayedWatchedCollectedShow(
      json['watcher_count'] as int,
      json['play_count'] as int,
      json['collected_count'] as int,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

AnticipatedShow _$AnticipatedShowFromJson(Map<String, dynamic> json) =>
    AnticipatedShow(
      json['list_count'] as int,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

UpdatedShow _$UpdatedShowFromJson(Map<String, dynamic> json) => UpdatedShow(
      json['updated_at'] as String,
      Show.fromJson(json['show'] as Map<String, dynamic>),
    );

ShowCertification _$ShowCertificationFromJson(Map<String, dynamic> json) =>
    ShowCertification(
      json['certification'] as String,
      json['country'] as String,
    );

ShowTranslation _$ShowTranslationFromJson(Map<String, dynamic> json) =>
    ShowTranslation(
      json['title'] as String?,
      json['overview'] as String?,
      json['language'] as String?,
    );

ShowStats _$ShowStatsFromJson(Map<String, dynamic> json) => ShowStats(
      json['watchers'] as int,
      json['plays'] as int,
      json['collectors'] as int,
      json['comments'] as int,
      json['lists'] as int,
      json['votes'] as int,
      json['recommended'] as int,
      json['collected_episodes'] as int,
    );

ShowCollectionProgress _$ShowCollectionProgressFromJson(
        Map<String, dynamic> json) =>
    ShowCollectionProgress(
      json['aired'] as int,
      json['completed'] as int,
      (json['seasons'] as List<dynamic>)
          .map((e) => ShowSeasonProgress.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['last_collected_at'] as String,
      (json['hidden_seasons'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['next_episode'] == null
          ? null
          : Episode.fromJson(json['next_episode'] as Map<String, dynamic>),
      json['last_episode'] == null
          ? null
          : Episode.fromJson(json['last_episode'] as Map<String, dynamic>),
    );

ShowWatchedProgress _$ShowWatchedProgressFromJson(Map<String, dynamic> json) =>
    ShowWatchedProgress(
      json['aired'] as int,
      json['completed'] as int,
      (json['seasons'] as List<dynamic>)
          .map((e) => ShowSeasonProgress.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['last_watched_at'] as String,
      (json['hidden_seasons'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['next_episode'] == null
          ? null
          : Episode.fromJson(json['next_episode'] as Map<String, dynamic>),
      json['last_episode'] == null
          ? null
          : Episode.fromJson(json['last_episode'] as Map<String, dynamic>),
      json['reset_at'] as String?,
    );

ShowSeasonProgress _$ShowSeasonProgressFromJson(Map<String, dynamic> json) =>
    ShowSeasonProgress(
      json['number'] as int,
      json['aired'] as int,
      json['completed'] as int,
      json['title'] as String,
      (json['episodes'] as List<dynamic>)
          .map((e) => ShowEpisodeProgress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ShowEpisodeProgress _$ShowEpisodeProgressFromJson(Map<String, dynamic> json) =>
    ShowEpisodeProgress(
      json['number'] as int,
      json['completed'] as bool,
      json['collected_at'] as String?,
    );

ShowProgressReset _$ShowProgressResetFromJson(Map<String, dynamic> json) =>
    ShowProgressReset(
      json['reset_at'] as String,
    );

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['username'] as String,
      json['name'] as String?,
      json['private'] as bool,
      json['vip'] as bool? ?? false,
      json['vip_ep'] as bool? ?? false,
      Ids.fromJson(json['ids'] as Map<String, dynamic>),
      json['location'] as String?,
      json['about'] as String?,
      json['gender'] as String?,
      json['age'] as int?,
      json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      json['joined_at'] as String?,
    );

UserStats _$UserStatsFromJson(Map<String, dynamic> json) => UserStats(
      json['rating'] as int?,
      json['play_count'] as int,
      json['completed_count'] as int,
    );

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      json['full'] as String,
    );
