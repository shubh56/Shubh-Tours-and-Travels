import 'package:flutter/material.dart';
import 'homepage.dart';
import 'aboutus.dart';
import 'tourpackages.dart';
import 'hotels.dart';
import 'airtickets.dart';
import 'signin.dart';
import 'signup.dart';
import 'allthree.dart';
import 'splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'admin.dart';
import 'reqAir.dart';
import 'reqHotel.dart';
import 'reqTour.dart';
import 'custTourReq.dart';
import 'recommendPackage.dart';

void main() {
  runApp(const RoutesClass());
}

class RoutesClass extends StatelessWidget {
  const RoutesClass({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashscreen',
      routes: {
        'splashscreen': (context)=> SplashScreen(),
        'homepage':(context)=> const HomePage(),
        'aboutus': (context) =>  const AboutUs(),
        'tourpacks' : (context) => const TourPackages(),
        'hotels' : (context) => const Hotels(),
        'airtickets': (context) =>  AirTickets(),
        'signin' : (context)=> const SignIn(),
        'signup' : (context) => const SignUp(),
        'allthree': (context) => const ThreeOptions(),
        'admin': (context) => const AdminPage(),
        'reqHotel': (context)=> const RequestHotel(),
        'reqAir': (context)=> const RequestAir(),
        'reqTour': (context)=> const RequestTour(),
        'custTourReq' : (context) => const CustomerTourRequest(),
        'recommendPackage' :  (context) => const RecommendPackage(),
      },
    );
  }
}
