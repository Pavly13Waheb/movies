/// page : 1
/// results : [{"adult":false,"backdrop_path":"/5QEtCBM6aXHftr7sgFxxUUl9Ej8.jpg","genre_ids":[80,18,53,28],"id":75780,"original_language":"en","original_title":"Jack Reacher","overview":"When a gunman takes five lives with six shots, all evidence points to the suspect in custody. On interrogation, the suspect offers up a single note: \"Get Jack Reacher!\" So begins an extraordinary chase for the truth, pitting Jack Reacher against an unexpected enemy, with a skill for violence and a secret to keep.","popularity":67.02,"poster_path":"/uQBbjrLVsUibWxNDGA4Czzo8lwz.jpg","release_date":"2012-12-20","title":"Jack Reacher","video":false,"vote_average":6.595,"vote_count":6360},{"adult":false,"backdrop_path":"/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg","genre_ids":[28,53],"id":343611,"original_language":"en","original_title":"Jack Reacher: Never Go Back","overview":"When Major Susan Turner is arrested for treason, ex-investigator Jack Reacher undertakes the challenging task to prove her innocence and ends up exposing a shocking conspiracy.","popularity":47.782,"poster_path":"/cOg3UT2NYWHZxp41vpxAnVCOC4M.jpg","release_date":"2016-10-19","title":"Jack Reacher: Never Go Back","video":false,"vote_average":5.938,"vote_count":4406},{"adult":false,"backdrop_path":null,"genre_ids":[99],"id":1045592,"original_language":"en","original_title":"Jack Reacher: When the Man Comes Around","overview":"Cast and crew speak on adapting One Shot as the first Jack Reacher film, casting Tom Cruise, earning Lee Child's blessing, additional character qualities and the performances that shape them, Lee Child's cameo in the film, and shooting the film's climax.","popularity":3.576,"poster_path":null,"release_date":"2013-05-07","title":"Jack Reacher: When the Man Comes Around","video":false,"vote_average":10.0,"vote_count":1}]
/// total_pages : 1
/// total_results : 3

class SearchDM {
  SearchDM({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  SearchDM.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

/// adult : false
/// backdrop_path : "/5QEtCBM6aXHftr7sgFxxUUl9Ej8.jpg"
/// genre_ids : [80,18,53,28]
/// id : 75780
/// original_language : "en"
/// original_title : "Jack Reacher"
/// overview : "When a gunman takes five lives with six shots, all evidence points to the suspect in custody. On interrogation, the suspect offers up a single note: \"Get Jack Reacher!\" So begins an extraordinary chase for the truth, pitting Jack Reacher against an unexpected enemy, with a skill for violence and a secret to keep."
/// popularity : 67.02
/// poster_path : "/uQBbjrLVsUibWxNDGA4Czzo8lwz.jpg"
/// release_date : "2012-12-20"
/// title : "Jack Reacher"
/// video : false
/// vote_average : 6.595
/// vote_count : 6360

class Results {
  Results({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}