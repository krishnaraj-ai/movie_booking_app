import 'movie.dart';

class Listed {
  List<Movie> movies = [
    Movie(
      name: 'kgf',
      imagePath: 'lib/images/kgf.jpg',
    ),
    Movie(
      name: 'End Game',
      imagePath: 'lib/images/avengers.jpg',
    ),
    Movie(
      name: 'Jawan',
      imagePath: 'lib/images/jawan.jpg',
    ),
    Movie(
      name: 'Jigar Thanda',
      imagePath: 'lib/images/jigar.jpg',
    ),
  ];

  List<Movie> getMovieList() {
    return movies;
  }
}
