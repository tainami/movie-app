import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/spacing.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
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
          const SizedBox(
            height: Spacing.m10,
          ),
          SizedBox(
            height: size == "large"
                ? context.percentHeight(0.23)
                : context.percentHeight(0.16),
            child: ListView.builder(
              itemCount: imageUrls.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
              ) {
                return Container(
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
          ),
        ],
      ),
    );
  }
}
