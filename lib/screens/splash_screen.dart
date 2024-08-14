import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:moviz/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8),
     () { 
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen(),));
     });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 59, 5, 21),
            Color.fromARGB(255, 135, 23, 71)
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/PngItem_1133142.png',
              width: 300,
              height: 350,
              ),
              Text('Moviz',
               style: GoogleFonts.roadRage(
           fontSize: 100,
           fontWeight: FontWeight.w400,
           color: Color.fromARGB(255, 251, 20, 20),
           ),
              ),
            Lottie.network("https://lottie.host/417156ad-bf20-41fe-9d79-d290c695cb6d/yJTtG6D1Ot.json",
            width: 300,
            height: 100
            ),
            const SizedBox(height: 40),
            Text('Version 1.0',
             style: GoogleFonts.roadRage(
           fontSize: 20,
           fontWeight: FontWeight.w400,
           color: Colors.white
            )
            )
            ],
          ),
        ),
      ),
    );
  }
}