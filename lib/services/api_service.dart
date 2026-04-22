import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = "809c422a7e76b3a843149a37e9036e3e";

  Future<List> fetchMovies() async {
    final url =
        "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception("Failed to load movies");
    }
  }
  Future<List> fetchMoviesByCategory(String category) async {
  final url =
      "https://api.themoviedb.org/3/movie/$category?api_key=$apiKey";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return json.decode(response.body)['results'];
  } else {
    throw Exception("Failed to load category movies");
  }
}
}