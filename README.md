# track_dart

A Trakt client library for dart.

To learn more about Trakt visit [*offical site*](https://www.trakt.tv)

To learn more about the Trakt API visit [*offical site*](https://trakt.docs.apiary.io)

## Features
All version 2 requests for all Categories!

[File any issues you see or feature requests](https://github.com/nikkithomas2012/trakt_dart/issues/new)

## Getting started

1) **Adding as dependencies**

    [Pub.dev's installation guide](https://pub.dev/packages/tmdb_api#-installing-tab-)

    Add this to your package's pubspec.yaml file:

    ```yaml
    dependencies:
      trakt_dart: ^1.0.1
    ```

2) **Import it**

    Now in your Dart code, you can use:

    ```dart
    import 'package:trakt_dart/trakt_dart.dart';
    ```

## Usage

### Create Instance
In order to make calls to the Trakt API, you must first inialize the TraktManager with your clientId, clientSecret, ad redirectURI. To get these, you must first register an account with Trakt, then complete the [Create An App Application](https://trakt.tv/oauth/applications/new).

```dart
final traktManager = TraktManager(clientId: "${clientId}", clientSecret: "${clientSecret}", redirectURI: "${redirectURI}");
```

### Example Usage
To call the [trending movies endpoint](https://trakt.docs.apiary.io/#reference/movies/trending/get-trending-movies):

```dart
final trendingMovies = await traktManager.movies.getTrendingMovies(extendedFull: true);
```

## Planned Work
Since this is still a work in progress, I will be updating this package on a weekly bases until all of the endpoints are implmenented including OAuth. 

To follow the progress, follow me on Twitter [@damonique_b](https://twitter.com/damonique_b).
