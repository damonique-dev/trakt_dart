part of trakt_dart;

extension TraktModel on Type {
  static final Map<Type, Function(Map<String, dynamic>)> _processorMap = {
    // Common Models
    MovieShowMetadata: MovieShowMetadata.fromJsonModel,
    Ids: Ids.fromJsonModel,
    Comment: Comment.fromJsonModel,
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
    ShowStats: ShowStats.fromJsonModel,
    ShowCollectionProgress: ShowCollectionProgress.fromJsonModel,
    ShowWatchedProgress: ShowWatchedProgress.fromJsonModel,
    ShowSeasonProgress: ShowSeasonProgress.fromJsonModel,
    ShowEpisodeProgress: ShowEpisodeProgress.fromJsonModel,
    ShowProgressReset: ShowProgressReset.fromJsonModel,

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
    ShowPeople: ShowPeople.fromJsonModel,
    EpisodeCrewList: EpisodeCrewList.fromJsonModel,
    PersonMovieCredits: PersonMovieCredits.fromJsonModel,
    PersonMovieCrewCreditsList: PersonMovieCrewCreditsList.fromJsonModel,
    PersonShowCrewCreditsList: PersonShowCrewCreditsList.fromJsonModel,
    PersonShowCredits: PersonShowCredits.fromJsonModel,
    EpisodePeople: EpisodePeople.fromJsonModel,

    // Season Models
    Season: Season.fromJsonModel,
    SeasonStats: SeasonStats.fromJsonModel,

    // Episode Models
    Episode: Episode.fromJsonModel,
    EpisodeStats: EpisodeStats.fromJsonModel,

    // Search Models
    SearchResult: SearchResult.fromJsonModel,

    // Certification Models
    CertificationsResult: CertificationsResult.fromJsonModel,
    Certification: Certification.fromJsonModel,

    // Country Models
    Country: Country.fromJsonModel,

    // Genre Models
    Genre: Genre.fromJsonModel,

    // Language Models
    Language: Language.fromJsonModel,

    // List Models
    TraktList: TraktList.fromJsonModel,
    ListLikes: ListLikes.fromJsonModel,
    ListItem: ListItem.fromJsonModel,
    TrendingPopularList: TrendingPopularList.fromJsonModel,

    // Network Models
    Network: Network.fromJsonModel,

    // Authentication Models
    AccessTokenResponse: AccessTokenResponse.fromJsonModel,

    // Calendar Models
    MyCalendarShow: MyCalendarShow.fromJsonModel,
    MyCalendarMovie: MyCalendarMovie.fromJsonModel,

    //Check in Models
    CheckInSharing: CheckInSharing.fromJsonModel,
    CheckInResponse: CheckInResponse.fromJsonModel,
  };

  Function(Map<String, dynamic>) get jsonDecoder {
    if (_processorMap[this] == null) {
      throw Exception("$this is not mapped to a JSON parser!");
    }

    return _processorMap[this]!;
  }
}
