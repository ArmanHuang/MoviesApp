import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/movie_model.dart';
import '../services/api_service.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> movies = [];
  List<Movie> allMovies = [];

  bool isLoading = false;
  bool isOffline = false; // 🔥 FLAG OFFLINE

  String selectedCategory = "popular";

  // ================= GET MOVIES =================
  Future<void> getMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await ApiService().fetchMovies();

      movies = data.map<Movie>((e) => Movie.fromJson(e)).toList();
      allMovies = movies;

      isOffline = false; // ✅ ONLINE

      await _saveCache(data);
    } catch (e) {
      debugPrint("Offline mode aktif (getMovies)");

      await _loadCache();
      isOffline = true; // ❗ OFFLINE
    }

    isLoading = false;
    notifyListeners();
  }

  // ================= FILTER =================
  Future<void> fetchByCategory(String category) async {
    selectedCategory = category;
    isLoading = true;
    notifyListeners();

    try {
      final data = await ApiService().fetchMoviesByCategory(category);

      movies = data.map<Movie>((e) => Movie.fromJson(e)).toList();
      allMovies = movies;

      isOffline = false;

      await _saveCache(data);
    } catch (e) {
      debugPrint("Offline mode aktif (filter)");

      await _loadCache();
      isOffline = true;
    }

    isLoading = false;
    notifyListeners();
  }

  // ================= SEARCH =================
  void searchMovies(String query) {
    if (query.isEmpty) {
      movies = allMovies;
    } else {
      movies = allMovies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  // ================= CACHE SAVE =================
  Future<void> _saveCache(List data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('movies_cache', jsonEncode(data));
  }

  // ================= CACHE LOAD =================
  Future<void> _loadCache() async {
    final prefs = await SharedPreferences.getInstance();
    final cache = prefs.getString('movies_cache');

    if (cache != null) {
      final decoded = jsonDecode(cache);
      movies = decoded.map<Movie>((e) => Movie.fromJson(e)).toList();
      allMovies = movies;
    }
  }
}