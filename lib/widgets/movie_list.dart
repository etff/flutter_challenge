import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/movie_model.dart';
import '../screens/detail_screen.dart';

class MovieList extends StatelessWidget {
  final String endpoint;

  const MovieList({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: ApiService.fetchMovies(endpoint),
      builder: (context, snapshot) {
          final movies = snapshot.data!;
          return SizedBox(
            height: 250,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  movies.length,
                      (index) {
                    final movie = movies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(movieId: movie.id),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                height: 180,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movie.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
      },
    );
  }
}
