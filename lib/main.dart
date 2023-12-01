//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/intro_page.dart';
//import 'package:movie_booking_app/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Movie Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
