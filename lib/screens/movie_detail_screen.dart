import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

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
              "https://image.tmdb.org/t/p/original/dyhaB19AICF7TO7CK2aD6KfymnQ.jpg",

              fit: BoxFit.cover,
              width: double.infinity,
              // alignment: const Alignment(0, 0.5),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
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
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1C1B1B).withOpacity(0.9),
                    const Color(0xFF1C1B1B),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
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
                    Icons.arrow_back_ios,
                    color: AppColors.light,
                    size: 20,
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
            child: Container(),
          ),
        ],
      ),
    );
  }
}
