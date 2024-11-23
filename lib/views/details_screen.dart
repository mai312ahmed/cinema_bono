// ignore_for_file: use_build_context_synchronously

import 'package:cinema_bono/methods/get_data_methods.dart';
import 'package:cinema_bono/methods/helper_methods.dart';
import 'package:cinema_bono/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'select_time_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> movieDetails;

  const DetailsScreen({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(
            image: 'assets/images/img2.jpeg',
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                movieDetails['image'],
                                height: MediaQuery.sizeOf(context).height / 2,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            movieDetails['name'],
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          DetailsRow(
                            label: 'Genre',
                            text: movieDetails['genre'],
                          ),
                          const SizedBox(height: 4),
                          DetailsRow(
                            label: 'Duration',
                            text: movieDetails['duration'],
                          ),
                          const SizedBox(height: 4),
                          DetailsRowForMulti(
                            label: 'Actors',
                            text: movieDetails['actors'].cast<String>(),
                          ),
                          const SizedBox(height: 4),
                          DetailsRow(
                            label: 'Description',
                            text: movieDetails['description'],
                          ),
                          const SizedBox(height: 4),
                          DetailsRow(
                            label: 'Summary',
                            text: movieDetails['summary'],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        showloading(context);
                        var halls = await getHalls();
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectTimeScreen(
                              movieDetails: movieDetails,
                              hallsDetails: halls,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Book Now for ${movieDetails['price']}',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.purple),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // لضبط النصوص العمودية
      children: [
        Text(
          "$label : ",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}

class DetailsRowForMulti extends StatelessWidget {
  const DetailsRowForMulti({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final List<String> text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // لضبط النصوص العمودية
      children: [
        Text(
          "$label : ",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Text(
            text.join(" ,"),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            softWrap: true, // للسماح للنص بالالتفاف
            overflow: TextOverflow.visible, // لإظهار النص كاملاً
          ),
        ),
      ],
    );
  }
}
