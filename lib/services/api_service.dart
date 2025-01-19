import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';
import '../models/movie_detail_model.dart';

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';

  static Future<List<MovieModel>> fetchMovies(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['results'];
      return jsonData.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('loading failed');
    }
  }

  static Future<MovieDetailModel> fetchMovieDetails(int movieId) async {
    final response = await http.get(Uri.parse('$baseUrl/movie?id=$movieId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return MovieDetailModel.fromJson(jsonData);
    } else {
      throw Exception('loading failed');
    }
  }
}
