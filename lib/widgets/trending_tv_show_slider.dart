import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviz/constants.dart';
import 'package:moviz/screens/details_screen_tv.dart';

class TrendingSliderTv extends StatelessWidget {
  const TrendingSliderTv({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: double.infinity,
     child: CarouselSlider.builder(
       itemCount: snapshot.data!.length,
       options: CarouselOptions(
         height: 300,
         autoPlay: true,
         viewportFraction: 0.55,
         enlargeCenterPage: true,
         pageSnapping: true,
         autoPlayCurve: Curves.fastOutSlowIn,
         autoPlayAnimationDuration: const Duration(seconds: 1)
       ),
       itemBuilder: (context,itemIndex,pageViewIndex){
         return GestureDetector(
          onTap: (){
            Navigator.push(context,
            MaterialPageRoute(builder: 
            (context) => DetailsScreenTv(tv: snapshot.data[itemIndex]),
            ),
            );
          },
           child: ClipRRect(
             borderRadius: BorderRadius.circular(12),
             child: SizedBox(
               height: 300,
               width: 200,
               child: (itemIndex < snapshot.data.length)
             ? Image.network(
                 '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                 filterQuality: FilterQuality.high,
                 fit: BoxFit.cover,
               )
             : Container(),
             ),
           ),
         );
       }
       ),
    );
  }
}