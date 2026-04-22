import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../views/detail_page.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(movie: movie),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(
          "https://image.tmdb.org/t/p/w500${movie.posterPath}",
          width: 100,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox(
              width: 100,
              height: 150,
              child: Icon(Icons.broken_image),
            );
          },
        ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("⭐ ${movie.rating}"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}