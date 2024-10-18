import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/widgets/movie_card.dart';

class MovieCourossel extends StatelessWidget {
  final List<String> imageUrls;
  final String title;
  final String size;

  const MovieCourossel.large({
    super.key,
    required this.imageUrls,
    required this.title,
    this.size = "large",
  });

  const MovieCourossel.mini({
    super.key,
    required this.imageUrls,
    required this.title,
    this.size = "mini",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.bodyLarge,
              ),
              Text(
                "See all",
                style: context.bodyLarge,
              ),
            ],
          ),
        ),
        FlutterCarousel.builder(
          options: FlutterCarouselOptions(
            autoPlay: false,
            height: MediaQuery.of(context).size.height * 0.4,
            showIndicator: false,
            viewportFraction: 0.42,
            enableInfiniteScroll: false,
            padEnds: false,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (
            BuildContext context,
            int itemIndex,
            int pageViewIndex,
          ) {
            return Container(
              alignment: Alignment.center,
              child: size == "large"
                  ? MovieCard.large(
                      url: imageUrls[itemIndex],
                      id: itemIndex,
                    )
                  : MovieCard.mini(
                      url: imageUrls[itemIndex],
                      id: itemIndex,
                    ),
            );
          },
        ),
      ],
    );
  }
}
