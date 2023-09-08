// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trakt_dart.dart';

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

DeviceCodeResponse _$DeviceCodeResponseFromJson(Map<String, dynamic> json) =>
    DeviceCodeResponse(
      json['device_code'] as String,
      json['user_code'] as String,
      json['verification_url'] as String,
      json['expires_in'] as int,
      json['interval'] as int,
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

CheckInSharing _$CheckInSharingFromJson(Map<String, dynamic> json) =>
    CheckInSharing(
      twitter: json['twitter'] as bool,
      tumblr: json['tumblr'] as bool,
    );

Map<String, dynamic> _$CheckInSharingToJson(CheckInSharing instance) =>
    <String, dynamic>{
      'twitter': instance.twitter,
      'tumblr': instance.tumblr,
    };

CheckInResponse _$CheckInResponseFromJson(Map<String, dynamic> json) =>
    CheckInResponse(
      json['id'] as int,
      json['watched_at'] as String,
      CheckInSharing.fromJson(json['sharing'] as Map<String, dynamic>),
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
    );

CommentSharing _$CommentSharingFromJson(Map<String, dynamic> json) =>
    CommentSharing(
      twitter: json['twitter'] as bool,
      tumblr: json['tumblr'] as bool,
      medium: json['medium'] as bool,
    );

Map<String, dynamic> _$CommentSharingToJson(CommentSharing instance) =>
    <String, dynamic>{
      'twitter': instance.twitter,
      'tumblr': instance.tumblr,
      'medium': instance.medium,
    };

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      json['id'] as int,
      json['replies'] as int,
      json['likes'] as int,
      json['sharing'] == null
          ? null
          : CommentSharing.fromJson(json['sharing'] as Map<String, dynamic>),
      json['comment'] as String,
      json['spoiler'] as bool,
      json['review'] as bool,
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['parent_id'] as int,
      UserStats.fromJson(json['user_stats'] as Map<String, dynamic>),
      json['created_at'] as String,
      json['updated_at'] as String,
    );

CommentMediaItem _$CommentMediaItemFromJson(Map<String, dynamic> json) =>
    CommentMediaItem(
      json['type'] as String,
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
    );

CommentLike _$CommentLikeFromJson(Map<String, dynamic> json) => CommentLike(
      json['liked_at'] as String,
      User.fromJson(json['user'] as Map<String, dynamic>),
    );

MediaComment _$MediaCommentFromJson(Map<String, dynamic> json) => MediaComment(
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
      json['list'] == null
          ? null
          : TraktList.fromJson(json['list'] as Map<String, dynamic>),
      Comment.fromJson(json['comment'] as Map<String, dynamic>),
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

Map<String, dynamic> _$IdsToJson(Ids instance) => <String, dynamic>{
      'slug': instance.slug,
      'trakt': instance.trakt,
      'tmdb': instance.tmdb,
      'tvdb': instance.tvdb,
      'imdb': instance.imdb,
    };

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

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      json['resolution'] as String?,
      json['hdr'] as String?,
      json['audio'] as String?,
      json['3d'] as bool?,
      json['media_type'] as String?,
      json['audio_channels'] as String?,
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

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'season': instance.season,
      'number': instance.number,
      'title': instance.title,
      'ids': instance.ids,
      'overview': instance.overview,
      'rating': instance.rating,
      'votes': instance.votes,
      'runtime': instance.runtime,
      'comment_count': instance.commentCount,
      'first_aired': instance.firstAired,
      'updated_at': instance.updatedAt,
      'available_translations': instance.availableTranslations,
    };

EpisodeStats _$EpisodeStatsFromJson(Map<String, dynamic> json) => EpisodeStats(
      json['watchers'] as int,
      json['plays'] as int,
      json['collectors'] as int,
      json['comments'] as int,
      json['lists'] as int,
      json['votes'] as int,
    );

CollectedEpisode _$CollectedEpisodeFromJson(Map<String, dynamic> json) =>
    CollectedEpisode(
      json['number'] as int,
      json['collected_at'] as String,
      json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

WatchedEpisode _$WatchedEpisodeFromJson(Map<String, dynamic> json) =>
    WatchedEpisode(
      json['number'] as int,
      json['plays'] as int,
      json['last_watched_at'] as String,
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
      json['description'] as String?,
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

ReorderListResponse _$ReorderListResponseFromJson(Map<String, dynamic> json) =>
    ReorderListResponse(
      (json['skipped_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['updated'] as int,
    );

AddToCustomListResponse _$AddToCustomListResponseFromJson(
        Map<String, dynamic> json) =>
    AddToCustomListResponse(
      UpdatedCustomListMetadata.fromJson(json['added'] as Map<String, dynamic>),
      UpdatedCustomListMetadata.fromJson(
          json['existing'] as Map<String, dynamic>),
      UpdatedCustomListNotFound.fromJson(
          json['not_found'] as Map<String, dynamic>),
    );

RemoveFromCustomListResponse _$RemoveFromCustomListResponseFromJson(
        Map<String, dynamic> json) =>
    RemoveFromCustomListResponse(
      UpdatedCustomListMetadata.fromJson(
          json['deleted'] as Map<String, dynamic>),
      UpdatedCustomListNotFound.fromJson(
          json['not_found'] as Map<String, dynamic>),
    );

UpdatedCustomListMetadata _$UpdatedCustomListMetadataFromJson(
        Map<String, dynamic> json) =>
    UpdatedCustomListMetadata(
      json['movies'] as int,
      json['shows'] as int,
      json['seasons'] as int,
      json['episodes'] as int,
      json['people'] as int,
    );

UpdatedCustomListNotFound _$UpdatedCustomListNotFoundFromJson(
        Map<String, dynamic> json) =>
    UpdatedCustomListNotFound(
      (json['movies'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['shows'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['seasons'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['episodes'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['people'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
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

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'ids': instance.ids,
      'overview': instance.overview,
      'country': instance.country,
      'language': instance.language,
      'certification': instance.certification,
      'tagline': instance.tagline,
      'trailer': instance.trailer,
      'homepage': instance.homepage,
      'status': instance.status,
      'released': instance.released,
      'updatedAt': instance.updatedAt,
      'runtime': instance.runtime,
      'votes': instance.votes,
      'rating': instance.rating,
      'available_translations': instance.availableTranslations,
      'genres': instance.genres,
      'comment_count': instance.commentCount,
    };

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
      json['title'] as String?,
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

ScrobbleResponse _$ScrobbleResponseFromJson(Map<String, dynamic> json) =>
    ScrobbleResponse(
      json['id'] as int,
      json['action'] as String,
      (json['progress'] as num).toDouble(),
      CheckInSharing.fromJson(json['sharing'] as Map<String, dynamic>),
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
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

CollectedSeason _$CollectedSeasonFromJson(Map<String, dynamic> json) =>
    CollectedSeason(
      json['number'] as int,
      (json['episodes'] as List<dynamic>)
          .map((e) => CollectedEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

WatchedSeason _$WatchedSeasonFromJson(Map<String, dynamic> json) =>
    WatchedSeason(
      json['number'] as int,
      (json['episodes'] as List<dynamic>)
          .map((e) => WatchedEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
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

SyncActivity _$SyncActivityFromJson(Map<String, dynamic> json) => SyncActivity(
      json['all'] as String,
      ActivityItem.fromJson(json['movies'] as Map<String, dynamic>),
      ActivityItem.fromJson(json['episodes'] as Map<String, dynamic>),
      ActivityItem.fromJson(json['shows'] as Map<String, dynamic>),
      ActivityItem.fromJson(json['seasons'] as Map<String, dynamic>),
      ActivityItem.fromJson(json['comments'] as Map<String, dynamic>),
      ActivityItem.fromJson(json['lists'] as Map<String, dynamic>),
      ActivityItem.fromJson(json['watchlist'] as Map<String, dynamic>),
      ActivityItem.fromJson(json['recommendations'] as Map<String, dynamic>),
      ActivityItem.fromJson(json['account'] as Map<String, dynamic>),
    );

ActivityItem _$ActivityItemFromJson(Map<String, dynamic> json) => ActivityItem(
      json['watched_at'] as String?,
      json['collected_at'] as String?,
      json['rated_at'] as String?,
      json['watchlisted_at'] as String?,
      json['recommendations_at'] as String?,
      json['commented_at'] as String?,
      json['paused_at'] as String?,
      json['hidden_at'] as String?,
      json['liked_at'] as String?,
      json['updated_at'] as String?,
      json['settings_at'] as String?,
      json['followed_at'] as String?,
      json['following_at'] as String?,
      json['pending_at'] as String?,
    );

PlaybackProgress _$PlaybackProgressFromJson(Map<String, dynamic> json) =>
    PlaybackProgress(
      json['id'] as int,
      (json['progress'] as num).toDouble(),
      json['type'] as String,
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
      json['paused_at'] as String,
    );

AddToSyncResponse _$AddToSyncResponseFromJson(Map<String, dynamic> json) =>
    AddToSyncResponse(
      json['added'] == null
          ? null
          : AddToSyncResult.fromJson(json['added'] as Map<String, dynamic>),
      json['updated'] == null
          ? null
          : AddToSyncResult.fromJson(json['updated'] as Map<String, dynamic>),
      json['existing'] == null
          ? null
          : AddToSyncResult.fromJson(json['existing'] as Map<String, dynamic>),
      UpdatedSyncNotFound.fromJson(json['not_found'] as Map<String, dynamic>),
    );

AddToSyncResult _$AddToSyncResultFromJson(Map<String, dynamic> json) =>
    AddToSyncResult(
      json['movies'] as int?,
      json['episodes'] as int?,
      json['shows'] as int?,
    );

UpdatedSyncNotFound _$UpdatedSyncNotFoundFromJson(Map<String, dynamic> json) =>
    UpdatedSyncNotFound(
      (json['movies'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['shows'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['seasons'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['episodes'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

RemoveFromSyncResponse _$RemoveFromSyncResponseFromJson(
        Map<String, dynamic> json) =>
    RemoveFromSyncResponse(
      UpdatedSyncMetadata.fromJson(json['deleted'] as Map<String, dynamic>),
      UpdatedSyncNotFound.fromJson(json['not_found'] as Map<String, dynamic>),
    );

UpdatedSyncMetadata _$UpdatedSyncMetadataFromJson(Map<String, dynamic> json) =>
    UpdatedSyncMetadata(
      json['movies'] as int?,
      json['shows'] as int?,
      json['seasons'] as int?,
      json['episodes'] as int?,
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
      json['vip_og'] as bool?,
      json['vip_years'] as int?,
      json['vip_cover_image'] as String?,
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

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) => UserSettings(
      User.fromJson(json['user'] as Map<String, dynamic>),
      UserAccount.fromJson(json['account'] as Map<String, dynamic>),
      UserConnections.fromJson(json['connections'] as Map<String, dynamic>),
      UserSharingText.fromJson(json['sharing_text'] as Map<String, dynamic>),
    );

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) => UserAccount(
      json['timezone'] as String,
      json['date_format'] as String,
      json['time_24hr'] as bool,
      json['cover_image'] as String?,
    );

UserConnections _$UserConnectionsFromJson(Map<String, dynamic> json) =>
    UserConnections(
      json['facebook'] as bool,
      json['twitter'] as bool,
      json['google'] as bool,
      json['tumblr'] as bool,
      json['medium'] as bool,
      json['slack'] as bool,
      json['apple'] as bool,
    );

UserSharingText _$UserSharingTextFromJson(Map<String, dynamic> json) =>
    UserSharingText(
      json['watching'] as String?,
      json['watched'] as String?,
      json['rated'] as String?,
    );

FollowRequest _$FollowRequestFromJson(Map<String, dynamic> json) =>
    FollowRequest(
      json['id'] as int,
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['requested_at'] as String,
    );

Follower _$FollowerFromJson(Map<String, dynamic> json) => Follower(
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['followed_at'] as String,
    );

HiddenItem _$HiddenItemFromJson(Map<String, dynamic> json) => HiddenItem(
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
      json['hidden_at'] as String,
    );

UserLike _$UserLikeFromJson(Map<String, dynamic> json) => UserLike(
      json['type'] as String,
      json['liked_at'] as String,
      json['comment'] == null
          ? null
          : Comment.fromJson(json['comment'] as Map<String, dynamic>),
      json['list'] == null
          ? null
          : TraktList.fromJson(json['list'] as Map<String, dynamic>),
    );

UserCollectionItem _$UserCollectionItemFromJson(Map<String, dynamic> json) =>
    UserCollectionItem(
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
      json['collected_at'] as String?,
      json['updated_at'] as String?,
      (json['seasons'] as List<dynamic>?)
          ?.map((e) => CollectedSeason.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      json['last_collected_at'] as String?,
      json['last_updated_at'] as String?,
    );

Following _$FollowingFromJson(Map<String, dynamic> json) => Following(
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['approved_at'] as String?,
    );

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['friends_at'] as String,
    );

HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) => HistoryItem(
      json['id'] as int,
      json['watched_at'] as String,
      json['action'] as String,
      json['type'] as String,
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
    );

RatedItem _$RatedItemFromJson(Map<String, dynamic> json) => RatedItem(
      json['rating'] as int,
      json['rated_at'] as String,
      json['type'] as String,
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['season'] == null
          ? null
          : Season.fromJson(json['season'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
    );

WatchlistItem _$WatchlistItemFromJson(Map<String, dynamic> json) =>
    WatchlistItem(
      json['rank'] as int,
      json['listed_at'] as String,
      json['type'] as String,
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['season'] == null
          ? null
          : Season.fromJson(json['season'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
    );

PersonalRecommendation _$PersonalRecommendationFromJson(
        Map<String, dynamic> json) =>
    PersonalRecommendation(
      json['rank'] as int,
      json['listed_at'] as String,
      json['type'] as String,
      json['notes'] as String?,
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['season'] == null
          ? null
          : Season.fromJson(json['season'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
    );

Watching _$WatchingFromJson(Map<String, dynamic> json) => Watching(
      json['action'] as String?,
      json['type'] as String?,
      json['expires_at'] as String?,
      json['started_at'] as String?,
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['episode'] == null
          ? null
          : Episode.fromJson(json['episode'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
    );

WatchedItem _$WatchedItemFromJson(Map<String, dynamic> json) => WatchedItem(
      json['plays'] as int,
      json['last_watched_at'] as String?,
      json['last_updated_at'] as String?,
      json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      json['show'] == null
          ? null
          : Show.fromJson(json['show'] as Map<String, dynamic>),
      (json['seasons'] as List<dynamic>?)
          ?.map((e) => WatchedSeason.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      UserMovieSEpisodeStats.fromJson(json['movies'] as Map<String, dynamic>),
      UserMovieSEpisodeStats.fromJson(json['episodes'] as Map<String, dynamic>),
      UserShowStats.fromJson(json['shows'] as Map<String, dynamic>),
      UserSeasonStats.fromJson(json['seasons'] as Map<String, dynamic>),
      UserNetworkStats.fromJson(json['network'] as Map<String, dynamic>),
      UserRatingStats.fromJson(json['ratings'] as Map<String, dynamic>),
    );

UserMovieSEpisodeStats _$UserMovieSEpisodeStatsFromJson(
        Map<String, dynamic> json) =>
    UserMovieSEpisodeStats(
      json['plays'] as int,
      json['watched'] as int,
      json['minutes'] as int,
      json['collected'] as int,
      json['ratings'] as int,
      json['comments'] as int,
    );

UserShowStats _$UserShowStatsFromJson(Map<String, dynamic> json) =>
    UserShowStats(
      json['watched'] as int,
      json['collected'] as int,
      json['ratings'] as int,
      json['comments'] as int,
    );

UserNetworkStats _$UserNetworkStatsFromJson(Map<String, dynamic> json) =>
    UserNetworkStats(
      json['friends'] as int,
      json['followers'] as int,
      json['following'] as int,
    );

UserSeasonStats _$UserSeasonStatsFromJson(Map<String, dynamic> json) =>
    UserSeasonStats(
      json['ratings'] as int,
      json['comments'] as int,
    );

UserRatingStats _$UserRatingStatsFromJson(Map<String, dynamic> json) =>
    UserRatingStats(
      json['total'] as int,
      Map<String, int>.from(json['distribution'] as Map),
    );
