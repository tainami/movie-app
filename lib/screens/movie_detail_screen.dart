import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/widgets/movie_carrousel.dart';
import 'package:movie_app/widgets/movie_tags.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Stack(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/original/mOwx1M7jp0Om598DsBD0AxbwH0m.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF000000),
                    const Color(0xFF1C1B1B).withOpacity(0.9),
                    const Color(0xFF1C1B1B).withOpacity(0.5),
                    Colors.transparent,
                  ],
                  begin: const Alignment(0.0, 0.1),
                  end: const Alignment(0.0, -0.9),
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 40,
              leadingWidth: 56,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: Spacing.x16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    color: AppColors.light,
                    size: 26,
                  ),
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: Spacing.x16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primary,
                    ),
                    child: const Icon(
                      Icons.share,
                      color: AppColors.light,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: context.percentHeight(0.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Shrek',
                    style: context.headlineLarge,
                  ),
                  const SizedBox(height: 12),
                  const MovieTags(
                    tags: [
                      "Aventura",
                      "Animação",
                      "DreamWorks",
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at ullamcorper nibh. Vivamus ut tellus nec leo maximus pretium. Praesent nec tortor egestas massa cursus sollicitudin a tristique tortor. Sed nec sodales velit, quis aliquam justo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean facilisis consequat augue, eu gravida turpis congue at. Donec id malesuada lorem. Vivamus faucibus, augue id fermentum iaculis, ante lorem rutrum leo, sed hendrerit sem felis a nisi. Praesent porta non ligula a mattis. In maximus elementum diam ac venenatis. In hac habitasse platea dictumst. Maecenas lobortis ipsum ac diam lacinia, et molestie leo iaculis. Ut sagittis est in diam laoreet, vel faucibus nisi molestie.",
                    style: context.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 18),
                  const MovieCourossel.mini(
                    imageUrls: [
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF20QSMOsQ9zRnkg01qJcCcfnyrhO4EO68yTEzIEeuUdY9oe9bY9iXHzPhdG87-kyPPYQ&usqp=CAU",
                      "https://i.pinimg.com/474x/fe/19/24/fe1924bbc934f26190e4ce96db470e24.jpg",
                      "https://uploads.folhabv.com.br/2024/06/nHI4k7qF-1-1024x576.webp",
                      "https://i.pinimg.com/236x/47/71/cd/4771cd1d7043348059d8f6e9c981e0cf.jpg",
                      "https://i.ebayimg.com/images/g/Wh8AAOSwbYphWRzT/s-l1200.jpg",
                    ],
                    title: "The Cast",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
