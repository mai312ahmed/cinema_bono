import 'package:cinema_bono/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userName, required this.movies});
  final List<Map<String, dynamic>> movies;
  final String userName;

  @override
  Widget build(BuildContext context) {
    List newMovies = [];
    newMovies = movies.where((movie) => movie["isNew"] == true).toList();

    return Scaffold(
      body: Stack(
        children: [
          const Background(
            image: 'assets/images/img2.jpeg',
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi $userName",
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white)),
                    const Text("New Movies ",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    SizedBox(
                        height: 190,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newMovies.length,
                          itemBuilder: (context, index) {
                            return NewMovieCard(newMovie: newMovies[index]);
                          },
                        )),
                    const Text("All movies",
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    Wrap(
                      runSpacing: 8.0,
                      children: List.generate(movies.length, (index) {
                        return MovieCard(movie: movies[index]);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Map<String, dynamic> movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(movieDetails: movie),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(movie['image']),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 160,
                width: 120,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Duration : ${movie['duration']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Genre: ${movie['genre']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Price: ${movie['price']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewMovieCard extends StatelessWidget {
  const NewMovieCard({
    super.key,
    required this.newMovie,
  });

  final Map<String, dynamic> newMovie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(movieDetails: newMovie),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(newMovie['image']),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 120,
              ),
              const SizedBox(height: 8),
              // Movie Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      newMovie['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Price: ${newMovie['price']}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypeFilter extends StatelessWidget {
  const TypeFilter({
    super.key,
    this.isSelected = false,
    required this.text,
  });
  final bool isSelected;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all()),
        child: const Text("Drama"));
  }
}
