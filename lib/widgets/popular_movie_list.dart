import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../screens/detail_screen.dart';
import '../models/movie_model.dart';

class PopularMovieList extends StatelessWidget {
  final String endpoint;

  const PopularMovieList({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: ApiService.fetchMovies(endpoint),
      builder: (context, snapshot) {
          final movies = snapshot.data!;
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(movieId: movie.id),
                      ),
                    );
                  },
                  child: Container(
                    width: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
    );
  }
}
