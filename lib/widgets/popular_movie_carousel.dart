import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:movie_app/models/list_movie_model.dart';
import 'package:movie_app/widgets/movie_carousel_item.dart';

class PopularMovieCarousel extends StatelessWidget {
  final List<ListMovieModel> movies;

  const PopularMovieCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
      options: FlutterCarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        height: MediaQuery.of(context).size.height > 700
            ? MediaQuery.of(context).size.height * 0.4
            : MediaQuery.of(context).size.height * 0.6,
        showIndicator: true,
        slideIndicator: CircularSlideIndicator(
          slideIndicatorOptions: const SlideIndicatorOptions(
            indicatorRadius: 5,
          ),
        ),
      ),
      itemCount: movies.length,
      itemBuilder: (context, index, _) {
        return MovieCarouselItem(
          url: movies[index].imageUrl,
          title: movies[index].title,
          id: movies[index].id,
        );
      },
    );
  }
}
