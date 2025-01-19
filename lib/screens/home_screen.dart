import 'package:flutter/material.dart';
import '../widgets/movie_list.dart';
import '../widgets/popular_movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Popular Movies',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            PopularMovieList(endpoint: 'popular'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Now in Cinemas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            MovieList(endpoint: 'now-playing'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Coming Soon',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            MovieList(endpoint: 'coming-soon'),
          ],
        ),
      ),
    );
  }
}
