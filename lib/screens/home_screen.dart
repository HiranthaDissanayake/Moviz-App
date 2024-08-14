import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviz/api/api.dart';
import 'package:moviz/models/tv_show.dart';
import 'package:moviz/widgets/movie_slider.dart';
import 'package:moviz/widgets/trending_slider.dart';
import 'package:moviz/widgets/trending_tv_show_slider.dart';
import 'package:moviz/widgets/tv_show_slider.dart';

import '../models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

late Future<List<Movie>> trendingMovies;
late Future<List<Movie>> topRatedMovies;
late Future<List<Movie>> upcommingMovies;
late Future<List<TvShow>> topRatedTvShows;
late Future<List<TvShow>> trendingTvShows;
late Future<List<TvShow>> popularTvShows;

  @override
void initState() {
  super.initState();
  trendingMovies = Api().getTrendingMovies();
  topRatedMovies = Api().getTopRatedMovies();
  // upcommingMovies = Api().getNowPlayingMovies();
  topRatedTvShows = Api().getTopRatedTvSeries();
  trendingTvShows = Api().getTrendingTvShows();
  popularTvShows = Api().getPopularTvShows();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 30, 30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Moviz",
         style: GoogleFonts.roadRage(
         fontSize: 70,
         fontWeight: FontWeight.w400,
         color: Color.fromARGB(255, 251, 20, 20),
         ),
         ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Trending Movies",
              style: GoogleFonts.aBeeZee(fontSize: 25,color: const Color.fromARGB(255, 244, 93, 93)),
              ),
              const SizedBox(
                height: 16,
              ),
             SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return TrendingSlider(snapshot: snapshot);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },),
             ),
             const SizedBox(height: 10),
             const Divider(
              thickness: 1,
             ),
             const SizedBox(
              height: 32,
             ),
             Text("Top Rated Movies",style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white),
             ),
             const SizedBox(
              height: 32,
             ),
             SizedBox(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return MovieSlider(snapshot: snapshot);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },),
             ),
            //   const SizedBox(height: 10),
            //  const Divider(
            //   thickness: 1,
            //  ),
            //  const SizedBox(
            //   height: 32,
            //  ),
            //  Text("Now Playing Movies",style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white),
            //  ),
            //  const SizedBox(
            //   height: 32,
            //  ),
            //  SizedBox(
            //   child: FutureBuilder(
            //     future: upcommingMovies,
            //     builder: (context, snapshot) {
            //       if(snapshot.hasError){
            //         return Center(
            //           child: Text(snapshot.error.toString()),
            //         );
            //       }else if(snapshot.hasData){
            //         return MovieSlider(snapshot: snapshot);
            //       }else{
            //         return Center(child: CircularProgressIndicator(),);
            //       }
            //     },),
            //  ),
            const SizedBox(height: 10),
             const Divider(
              thickness: 3,
             ),
             const SizedBox(
              height: 32,
             ),
             Text("Trending Tv Shows",style: GoogleFonts.aBeeZee(fontSize: 25,color:const Color.fromARGB(255, 244, 93, 93)),
             ),
             const SizedBox(
              height: 32,
             ),
             SizedBox(
              child: FutureBuilder(
                future: trendingTvShows,
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return TrendingSliderTv(snapshot: snapshot);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },),
             ),
              const SizedBox(height: 10),
             const Divider(
              thickness: 1,
             ),
                const SizedBox(
              height: 32,
             ),
             Text("Top Rated Tv Shows",style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white),
             ),
             const SizedBox(
              height: 32,
             ),
             SizedBox(
              child: FutureBuilder(
                future: topRatedTvShows,
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return TvSlider(snapshot: snapshot);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },),
             ),

              const SizedBox(height: 10),
             const Divider(
              thickness: 1,
             ),
                const SizedBox(
              height: 32,
             ),
             Text("Popular Tv Shows",style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white),
             ),
             const SizedBox(
              height: 32,
             ),
             SizedBox(
              child: FutureBuilder(
                future: popularTvShows,
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return TvSlider(snapshot: snapshot);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
