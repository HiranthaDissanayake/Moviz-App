import 'dart:convert';

import 'package:moviz/constants.dart';
import 'package:moviz/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:moviz/models/tv_show.dart';


class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  // static const _nowPlayingUrl =
  //     'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';

  static const _topTvSeries = 
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';

  static const _trendingTvShow = 
      'https://api.themoviedb.org/3/trending/tv/day?api_key=${Constants.apiKey}';

  static const _popularTvShow =
      'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}'; 

  static const _tvShowVideos =
      'https://api.themoviedb.org/3/tv/{series_id}/videos?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await http.get(Uri.parse(_trendingUrl));

      print('Request URL: $_trendingUrl');
      
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        print('Decoded Data: $decodedData');
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        print('Failed to get trending movies. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error during API call: $e');
      return [];
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final response = await http.get(Uri.parse(_topRatedUrl));

      print('Request URL: $_topRatedUrl');
      
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        print('Decoded Data: $decodedData');
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        print('Failed to get top rated movies. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error during API call: $e');
      return [];
    }
  }

  // Future<List<Movie>> getNowPlayingMovies() async {
  //   try {
  //     final response = await http.get(Uri.parse(_nowPlayingUrl));

  //     print('Request URL: $_nowPlayingUrl');
      
  //     if (response.statusCode == 200) {
  //       final decodedData = json.decode(response.body)['results'] as List;
  //       print('Decoded Data: $decodedData');
  //       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
  //     } else {
  //       print('Failed to get top rated movies. Status code: ${response.statusCode}');
  //       return [];
  //     }
  //   } catch (e) {
  //     print('Error during API call: $e');
  //     return [];
  //   }
  // }

  Future<List<TvShow>> getTopRatedTvSeries() async {
    try {
      final response = await http.get(Uri.parse(_topTvSeries));

      print('Request URL: $_topTvSeries');
      
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        print('Decoded Data: $decodedData');
        return decodedData.map((tv) => TvShow.fromJson(tv)).toList();
      } else {
        print('Failed to get top rated tv shows. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error during API call: $e');
      return [];
    }
  }

  Future<List<TvShow>> getTrendingTvShows() async {
    try {
      final response = await http.get(Uri.parse(_trendingTvShow));

      print('Request URL: $_trendingTvShow');
      
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        print('Decoded Data: $decodedData');
        return decodedData.map((tv) => TvShow.fromJson(tv)).toList();
      } else {
        print('Failed to get trending tv shows. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error during API call: $e');
      return [];
    }
  }

  Future<List<TvShow>> getPopularTvShows() async {
    try {
      final response = await http.get(Uri.parse(_popularTvShow));

      print('Request URL: $_popularTvShow');
      
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        print('Decoded Data: $decodedData');
        return decodedData.map((tv) => TvShow.fromJson(tv)).toList();
      } else {
        print('Failed to get popular tv shows. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error during API call: $e');
      return [];
    }
  }

// Future<TvShowDetail> getMovieDetail(int tvShowId) async {
//     try {
//       final response = await http.get(Uri.parse(_tvShowVideos));

//      if (response.statusCode == 200) {
//       // Parse the response body as JSON
//       Map<String, dynamic> responseData = json.decode(response.body);
//       TvShowDetail tvshow = TvShowDetail.fromJson(responseData);

//       tvshow.trailerId = await getYoutubeId(tvShowId);

//       return tvshow;
//     }
//     } catch (e,stacktrace) {
//       throw Exception('Exception occoured: $e with stacktrace: $stacktrace');
//     }
//   }


   Future<List<TvShow>> fetchMovies() async {
    final response = await http.get(
      Uri.parse(_trendingTvShow),
    );

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final tvShows = (decodedResponse['results'] as List)
          .map((tv) => TvShow.fromJson(tv)).toList();

      // Fetch trailer keys for each movie
      for (var tv in tvShows) {
        final trailerResponse = await http.get(Uri.parse(
            'https://api.themoviedb.org/3/tv/${tv.id}/videos?api_key=${Constants.apiKey}'));
        if (trailerResponse.statusCode == 200) {
          final trailerData = json.decode(trailerResponse.body);
          tv.trailerKeys = (trailerData['results'] as List)
              .map<String>((trailer) => trailer['key'])
              .toList();
        }
      }

      return tvShows;
    } else {
      throw Exception('Failed to load movies');
    }
  }

}