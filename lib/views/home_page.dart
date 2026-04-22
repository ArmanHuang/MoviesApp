import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/loading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
      ),
      body: Column(
        children: [
        // 🔴 OFFLINE BANNER
        if (provider.isOffline)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: Colors.orange,
            child: const Text(
              "Offline Mode: Now showing saved data",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
      ),
          // 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search movie...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                provider.searchMovies(value);
              },
            ),
          ),

          // 🎯 FILTER DROPDOWN
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton<String>(
              value: provider.selectedCategory,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: "popular", child: Text("Popular")),
                DropdownMenuItem(value: "top_rated", child: Text("Top Rated")),
                DropdownMenuItem(value: "upcoming", child: Text("Upcoming")),
              ],
              onChanged: (value) {
                provider.fetchByCategory(value!);
              },
            ),
          ),

          // 📋 LIST MOVIE
          Expanded(
            child: provider.isLoading
                ? const LoadingWidget()
                : provider.movies.isEmpty
                    ? const Center(
                        child: Text(
                          "No data available.\nCheck your internet connection.",
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: provider.movies.length,
                        itemBuilder: (context, index) {
                          final movie = provider.movies[index];
                          return MovieCard(movie: movie);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}