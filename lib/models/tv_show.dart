// ignore_for_file: public_member_api_docs, sort_constructors_first


class TvShow {
   String name;
   int id;
   String backdropPath;
   String originalName;
   String overview;
   String posterPath;
   String firstAirDate;
   double voteAverage;
  late final List<String> trailerKeys;

  TvShow({
    required this.name,
    required this.id,
    required this.backdropPath,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.trailerKeys,
  });

  factory TvShow.fromJson(Map<String,dynamic> json){
    return TvShow(
      name: json["name"], 
      backdropPath: json["backdrop_path"], 
      originalName: json["original_name"], 
      overview: json["overview"], 
      posterPath: json["poster_path"], 
      firstAirDate: json["first_air_date"].toString(), 
      voteAverage: json["vote_average"].toDouble(),
      id: json["id"], 
      trailerKeys: [], 

      );
  }



}
