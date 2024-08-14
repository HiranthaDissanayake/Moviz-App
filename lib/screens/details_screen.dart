import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviz/constants.dart';
import 'package:moviz/models/movie.dart';
import 'package:moviz/widgets/back_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key, required this.movie
    });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 75, 71, 71),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: const Color.fromARGB(255, 75, 71, 71),
            leading: const BackBotton(),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title,
              style: GoogleFonts.belleza(
                fontSize: 17,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
              ),
              background: 
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)
                ),
                child: Image.network('${Constants.imagePath}${movie.backdropPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text('Overview',
                  style: GoogleFonts.openSans(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white
              ),
            ),
                  const SizedBox(height: 16,),
                  Text(movie.overview,
                  style: GoogleFonts.roadRage(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16,),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text('Release Date: ',
                            style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            ),   
                              ),
                              Text(movie.releaseDate,
                               style: GoogleFonts.roboto(
                               fontSize: 17,
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
                            ),
                              ),
                           
                            ],
                          ),
                        ),
                         Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rating: ',
                              style: GoogleFonts.roboto(
                               fontSize: 17,
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
                            ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text('${movie.voteAverage.toStringAsFixed(1)}/10',
                            style: GoogleFonts.roboto(
                               fontSize: 17,
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
                            ),
                            ),
                            
                            ],
                          ),
                            )
                      ],
                    ),
                  )
                ],
              ),
              ),
          )
        ],
      ),
    );
  }
}

