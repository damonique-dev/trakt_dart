part of trakt_dart;

extension TraktModel on Type {
  static final Map<Type, Function(Map<String, dynamic>)> _processorMap = {
    // Common Models
    MovieShowMetadata: MovieShowMetadata.fromJsonModel,
    Ids: Ids.fromJsonModel,
    Comment: Comment.fromJsonModel,
    Rating: Rating.fromJsonModel,
    MovieStats: MovieStats.fromJsonModel,
    Metadata: Metadata.fromJsonModel,

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
    UserSettings: UserSettings.fromJsonModel,
    UserAccount: UserAccount.fromJsonModel,
    UserConnections: UserConnections.fromJsonModel,
    UserSharingText: UserSharingText.fromJsonModel,
    FollowRequest: FollowRequest.fromJsonModel,
    Follower: Follower.fromJsonModel,
    Following: Following.fromJsonModel,
    HiddenItem: HiddenItem.fromJsonModel,
    UserCollectionItem: UserCollectionItem.fromJsonModel,
    UserLike: UserLike.fromJsonModel,
    Friend: Friend.fromJsonModel,
    HistoryItem: HistoryItem.fromJsonModel,
    RatedItem: RatedItem.fromJsonModel,
    WatchlistItem: WatchlistItem.fromJsonModel,
    PersonalRecommendation: PersonalRecommendation.fromJsonModel,
    Watching: Watching.fromJsonModel,
    WatchedItem: WatchedItem.fromJsonModel,
    Stats: Stats.fromJsonModel,
    UserMovieSEpisodeStats: UserMovieSEpisodeStats.fromJsonModel,
    UserShowStats: UserShowStats.fromJsonModel,
    UserSeasonStats: UserSeasonStats.fromJsonModel,
    UserNetworkStats: UserNetworkStats.fromJsonModel,
    UserRatingStats: UserRatingStats.fromJsonModel,

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
    CollectedSeason: CollectedSeason.fromJsonModel,
    WatchedSeason: WatchedSeason.fromJsonModel,

    // Episode Models
    Episode: Episode.fromJsonModel,
    EpisodeStats: EpisodeStats.fromJsonModel,
    CollectedEpisode: CollectedEpisode.fromJsonModel,
    WatchedEpisode: WatchedEpisode.fromJsonModel,

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
    ReorderListResponse: ReorderListResponse.fromJsonModel,
    AddToCustomListResponse: AddToCustomListResponse.fromJsonModel,
    RemoveFromCustomListResponse: RemoveFromCustomListResponse.fromJsonModel,
    UpdatedCustomListMetadata: UpdatedCustomListMetadata.fromJsonModel,
    UpdatedCustomListNotFound: UpdatedCustomListNotFound.fromJsonModel,

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

    // Comment Models
    CommentSharing: CommentSharing.fromJsonModel,
    CommentResponse: CommentResponse.fromJsonModel,
    CommentMediaItem: CommentMediaItem.fromJsonModel,
    CommentLike: CommentLike.fromJsonModel,
    MediaComment: MediaComment.fromJsonModel,

    // Scrobble Models
    ScrobbleResponse: ScrobbleResponse.fromJsonModel,
  };

  Function(Map<String, dynamic>) get jsonDecoder {
    if (_processorMap[this] == null) {
      throw Exception("$this is not mapped to a JSON parser!");
    }

    return _processorMap[this]!;
  }
}
