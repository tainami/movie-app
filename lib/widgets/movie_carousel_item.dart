import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';

class MovieCarouselItem extends StatelessWidget {
  final String url;
  final String title;
  final int id;

  const MovieCarouselItem({
    super.key,
    required this.url,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 250,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  url,
                  width: 200,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color(0xFFB68D4A),
                          Color(0xffedd0a1),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(movieId: id),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: Spacing.xs20,
        ),
        FittedBox(
          child: Text(
            title,
            style: context.headlineMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
