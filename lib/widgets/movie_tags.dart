import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class MovieTags extends StatelessWidget {
  final List<String> tags;

  const MovieTags({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        
        scrollDirection: Axis.horizontal,
        children: tags.map((tag) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(tag),
            ),
          );
        }).toList(),
      ),
    );
  }
}
