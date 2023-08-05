class MovieDetailsArg {
  String? backdropPath;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  num? voteAverage;
  num? voteCount;

  MovieDetailsArg(
      {this.posterPath,
      this.title,
      this.backdropPath,
      this.overview,
      this.voteCount,
      this.releaseDate,
      this.originalTitle,
      this.originalLanguage,
      this.voteAverage});
}
