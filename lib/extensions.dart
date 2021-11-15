import 'package:trakt_dart/models/common_models.dart';
import 'package:trakt_dart/models/episode_models.dart';
import 'package:trakt_dart/models/movie_models.dart';
import 'package:trakt_dart/models/people_models.dart';
import 'package:trakt_dart/models/season_models.dart';
import 'package:trakt_dart/models/show_models.dart';
import 'package:trakt_dart/models/users_models.dart';

extension TraktModel on Type {
  static final Map<Type, Function(Map<String, dynamic>)> _processorMap = {
    // Common Models
    MovieShowMetadata: MovieShowMetadata.fromJsonModel,
    Ids: Ids.fromJsonModel,
    Comment: Comment.fromJsonModel,
    TraktList: TraktList.fromJsonModel,
    Rating: Rating.fromJsonModel,
    MovieStats: MovieStats.fromJsonModel,

    // Movie Models
    Movie: Movie.fromJsonModel,
    TrendingMovie: TrendingMovie.fromJsonModel,
    RecommendedMovie: RecommendedMovie.fromJsonModel,
    PlayedWatchedCollectedMovie: PlayedWatchedCollectedMovie.fromJsonModel,
    AnticipatedMovie: AnticipatedMovie.fromJsonModel,
    BoxOfficeMovie: BoxOfficeMovie.fromJsonModel,
    UpdatedMovie: UpdatedMovie.fromJsonModel,
    MovieShowAlias: MovieShowAlias.fromJsonModel,
    MovieRelease: MovieRelease.fromJsonModel,
    MovieTranslation: MovieTranslation.fromJsonModel,

    // Show Models
    Show: Show.fromJsonModel,
    AirTime: AirTime.fromJsonModel,
    TrendingShow: TrendingShow.fromJsonModel,
    RecommendedShow: RecommendedShow.fromJsonModel,
    PlayedWatchedCollectedShow: PlayedWatchedCollectedShow.fromJsonModel,
    AnticipatedShow: AnticipatedShow.fromJsonModel,
    UpdatedShow: UpdatedShow.fromJsonModel,
    ShowCertification: ShowCertification.fromJsonModel,
    ShowTranslation: ShowTranslation.fromJsonModel,
    ShowPeople: ShowPeople.fromJsonModel,
    ShowStats: ShowStats.fromJsonModel,

    // User Models
    User: User.fromJsonModel,
    UserStats: UserStats.fromJsonModel,
    Images: Images.fromJsonModel,
    Avatar: Avatar.fromJsonModel,

    // People Models
    Person: Person.fromJsonModel,
    SocialIds: SocialIds.fromJsonModel,
    MovieCharacter: MovieCharacter.fromJsonModel,
    MovieCrew: MovieCrew.fromJsonModel,
    MoviePeople: MoviePeople.fromJsonModel,
    MovieCrewList: MovieCrewList.fromJsonModel,
    ShowCrewList: ShowCrewList.fromJsonModel,

    // Season Models
    Season: Season.fromJsonModel,

    // Episode Models
    Episode: Episode.fromJsonModel,
  };

  Function(Map<String, dynamic>) get jsonDecoder {
    if (_processorMap[this] == null) {
      throw Exception("$this is not mapped to a JSON parser!");
    }

    return _processorMap[this]!;
  }
}
