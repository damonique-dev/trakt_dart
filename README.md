# track_dart

<!-- markdownlint-disable MD033 -->
<img src="trakt_logo.svg" height=100px width="50%">

A Trakt client library for dart.

To learn more about Trakt visit [*offical site*](https://www.trakt.tv)

To learn more about the Trakt API visit [*offical site*](https://trakt.docs.apiary.io)

## Features
Current API calls implemented:
- All Movie Requests
- All Show Requests that require no OAuth
- All Show Season Requests
- All Show Episode Requests
- All People Requests

**Note:** This packaage is still in beta. [File any issues you see or feature requests](https://github.com/nikkithomas2012/trakt_dart/issues/new)

## Getting started

1) **Adding as dependencies**

    [Pub.dev's installation guide](https://pub.dev/packages/tmdb_api#-installing-tab-)

    Add this to your package's pubspec.yaml file:

    ```yaml
    dependencies:
      trakt_dart: ^0.1.0
    ```

2) **Import it**

    Now in your Dart code, you can use:

    ```dart
    import 'package:trakt_dart/trakt_dart.dart';
    ```

## Usage

### Initialize
In order to make calls to the Trakt API, you must first inialize the TraktManager with your clientId and clientSecret. To get these, you must first register an account with Trakt, then complete the [Create An App Application](https://trakt.tv/oauth/applications/new).

Once you have these values, initialize the TraktManager before making your first API call:

```dart
TraktManager.instance.initializeTraktMananager(
        clientId: "${clientId}", clientSecret: "${clientSecret}");
```

### Example Usage
To call the [trending movies endpoint](https://trakt.docs.apiary.io/#reference/movies/trending/get-trending-movies):

```dart
final trendingMovies = await TraktManager.instance.getTrendingMovies(extendedFull: true);
```

## Planned Work
Since this is still a work in progress, I will be updating this package on a weekly bases until all of the endpoints are implmenented including OAuth. 

To follow the progress, follow me on Twitter [@damonique_b](https://twitter.com/damonique_b).
