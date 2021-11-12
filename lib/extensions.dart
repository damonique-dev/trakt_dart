import 'package:trakt_dart/models/common_models.dart';
import 'package:trakt_dart/models/movie_models.dart';
import 'package:trakt_dart/models/people_models.dart';
import 'package:trakt_dart/models/users_models.dart';

extension TraktModel on Type {
  static final Map<Type, Function(Map<String, dynamic>)> _processorMap = {
    // Common Models
    MovieShowMetadata: MovieShowMetadata.fromJsonModel,
    Ids: Ids.fromJsonModel,
    Comment: Comment.fromJsonModel,
    TraktList: TraktList.fromJsonModel,
    Rating: Rating.fromJsonModel,
    Stats: Stats.fromJsonModel,
    
    // Movie Models
    Movie: Movie.fromJsonModel,
    TrendingMovie: TrendingMovie.fromJsonModel,
    RecommendedMovie: RecommendedMovie.fromJsonModel,
    PlayedWatchedCollectedMovie: PlayedWatchedCollectedMovie.fromJsonModel,
    AnticipatedMovie: AnticipatedMovie.fromJsonModel,
    BoxOfficeMovie: BoxOfficeMovie.fromJsonModel,
    UpdatedMovie: UpdatedMovie.fromJsonModel,
    MovieAlias: MovieAlias.fromJsonModel,
    MovieRelease: MovieRelease.fromJsonModel,
    MovieTranslation: MovieTranslation.fromJsonModel,
    MoviePeople: MoviePeople.fromJsonModel,

    // User Models
    User: User.fromJsonModel,
    UserStats: UserStats.fromJsonModel,
    Images: Images.fromJsonModel,
    Avatar: Avatar.fromJsonModel,

    // People Models
    Person: Person.fromJsonModel,
    SocialIds: SocialIds.fromJsonModel,
    Character: Character.fromJsonModel,
    Crew: Crew.fromJsonModel,
  };

  Function(Map<String, dynamic>) get jsonDecoder {
    if (_processorMap[this] == null) {
      throw Exception("$this is not mapped to a JSON parser!");
    }

    return _processorMap[this]!;
  }
}
