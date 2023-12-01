import 'package:flutter/material.dart';
import 'package:movie_booking_app/components/movie_tile.dart';
import 'package:movie_booking_app/model/movie.dart';
//import 'package:movie_booking_app/model/list.dart';
//import 'package:movie_booking_app/pages/home_page.dart';
//import 'package:movie_booking_app/pages/profile_page.dart';
import 'package:movie_booking_app/pages/seat_booking.dart';
//import 'package:movie_booking_app/pages/signup_page.dart';

class moviesPage extends StatelessWidget {
  const moviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 140,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("lib/images/leo-Banner.png")),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Trending Movies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Movie movie = Movie(
                name: "Avengers",
                imagePath: 'lib/images/movie1.jpg',
              );
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeatBookingScreen(),
                    ),
                  );
                },
                child: MovieTile(
                  movie: movie,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
