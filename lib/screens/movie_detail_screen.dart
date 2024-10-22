import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
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
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: Image.network(
              "https://image.tmdb.org/t/p/original/mOwx1M7jp0Om598DsBD0AxbwH0m.jpg",

              fit: BoxFit.cover,
              width: double.infinity,
              // alignment: const Alignment(0, 0.5),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1C1B1B).withOpacity(0.8),
                    const Color(0xFF1C1B1B),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppBar(
              toolbarHeight: 40,
              leadingWidth: 40,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
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
                Container(
                  width: 40,
                  height: 40,
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
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: 520, left: 16, right: 16, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
