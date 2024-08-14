class TvShowDetail {
   String name;
   String id;
   String backdropPath;
   String originalName;
   String overview;
   String posterPath;
   String firstAirDate;
   double voteAverage;

    String trailerId;

  TvShowDetail({
    required this.trailerId,
    required this.name,
    required this.id,
    required this.backdropPath,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage
  });

  factory TvShowDetail.fromJson(Map<String,dynamic> json){
    return TvShowDetail(
      name: json["name"], 
      backdropPath: json["backdrop_path"], 
      originalName: json["original_name"], 
      overview: json["overview"], 
      posterPath: json["poster_path"], 
      firstAirDate: json["first_air_date"].toString(), 
      voteAverage: json["vote_average"].toDouble(),
      id: json["id"].toString(), 
      trailerId: json["trailer_id"],

      );
  }



}