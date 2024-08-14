import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviz/constants.dart';
import 'package:moviz/models/tv_show.dart';
import 'package:moviz/widgets/back_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailsScreenTv extends StatelessWidget {
  const DetailsScreenTv({
    super.key, required this.tv, 
    });

  final TvShow tv;

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
              background: 
              Stack(
              children: [
                ClipPath(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)
                    ),
                    child: Image.network('${Constants.imagePath}${tv.backdropPath}',
                    filterQuality: FilterQuality.high,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 230),
                      child: GestureDetector(
                        onTap: () async{
                          playMovieTrailer(context, tv);
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.play_circle_outline_sharp,
                              color: Colors.yellow,
                              size: 65,
                              ),
                              Text(tv.name,
                              style: GoogleFonts.belleza(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                              ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
                ],
                
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
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
                  Text(tv.overview,
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
                              Text('First Air Date: ',
                            style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            ),   
                              ),
                              Text(tv.firstAirDate,
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
                            Text('${tv.voteAverage.toStringAsFixed(1)}/10',
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

void playMovieTrailer(BuildContext context, TvShow tv) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var trailerKey in tv.trailerKeys)
              ListTile(
                title: Text('Play Trailer $trailerKey'),
                onTap: () async {
                  final Uri url = Uri.parse('https://www.youtube.com/watch?v=$trailerKey');
                  if (await canLaunchUrl(url)) {
           
                    await launchUrl(url);
                  } else {
                    print('Could not launch $url');
                  }
                  Navigator.pop(context);
                },
              ),
            ListTile(
              title: Text('Close'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

