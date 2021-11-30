part of trakt_dart;

class RequestPagination {
  int page;
  int limit;

  void nextPage() {
    page++;
  }

  RequestPagination({this.page = 1, this.limit = 10});

  Map<String, dynamic> toMap() => {"page": "$page", "limit": "$limit"};
}

class Filters {
  String? query, years, runtime, ratings;
  List<String>? genres, languages, countries;

  Filters(
      {this.query,
      this.years,
      this.runtime,
      this.ratings,
      this.genres,
      this.countries,
      this.languages});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (query != null) {
      map["query"] = query!;
    }
    if (years != null) {
      map["years"] = years!;
    }
    if (runtime != null) {
      map["runtime"] = runtime!;
    }
    if (ratings != null) {
      map["ratings"] = ratings!;
    }

    if (genres != null) {
      map["genres"] = genres!.join(",");
    }
    if (countries != null) {
      map["countries"] = countries!.join(",");
    }
    if (languages != null) {
      map["languages"] = languages!.join(",");
    }

    return map;
  }
}

class MovieFilters extends Filters {
  List<String>? certifications;

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    if (certifications != null) {
      map["certifications"] = certifications!.join(",");
    }

    return map;
  }
}

class ShowFilters extends Filters {
  List<String>? certifications;
  List<String>? networks;
  List<ShowStatus>? status;

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    if (certifications != null) {
      map["certifications"] = certifications!.join(",");
    }
    if (networks != null) {
      map["networks"] = networks!.join(",");
    }
    if (status != null) {
      map["status"] = status!.map((e) => e.queryString).join(",");
    }
    return map;
  }
}

enum ShowStatus { returningSeries, inProduction, planned, canceled, ended }

extension ShowStatusString on ShowStatus {
  String get queryString {
    switch (this) {
      case ShowStatus.returningSeries:
        return "returning series";
      case ShowStatus.inProduction:
        return "in production";
      case ShowStatus.planned:
        return "planned";
      case ShowStatus.canceled:
        return "canceled";
      case ShowStatus.ended:
        return "ended";
    }
  }
}
