import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/screens/root_screen.dart';
import 'package:movie_app/store/movie_state.dart';
import 'package:movie_app/store/movie_store.dart';
import 'package:movie_app/widgets/gradient_background.dart';
import 'package:movie_app/widgets/movie_carousel.dart';
import 'package:movie_app/widgets/notification_icon.dart';
import 'package:movie_app/widgets/popular_movie_carousel.dart';
import 'package:movie_app/widgets/user_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MovieStore store;

  @override
  void initState() {
    super.initState();
    store = MovieStore(MovieRepositoryImpl(Dio()));
    store.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          SingleChildScrollView(
            controller: RootScreenControllers.homeScrollController,
            child: Column(
              children: [
                AppBar(
                  toolbarHeight: 70,
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserAvatar(),
                      NotificationIcon(),
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: store,
                        builder: (context, movieState, child) {
                          if (movieState is MovieStateError) {
                            return Center(
                              child: Text(movieState.message ?? 'Erro padrão'),
                            );
                          }
                          if (movieState is MovieStateLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                          if (movieState is MovieStateSuccess) {
                            return PopularMovieCarousel(
                                movies: movieState.movies);
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(
                        height: Spacing.x16,
                      ),
                      const MovieCarousel.large(
                        imageUrls: [
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                        ],
                        title: "Recent",
                      ),
                      const SizedBox(
                        height: Spacing.x16,
                      ),
                      const MovieCarousel.large(
                        imageUrls: [
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                        ],
                        title: "My Favorites",
                      ),
                      const SizedBox(
                        height: Spacing.xxm32 + kBottomNavigationBarHeight,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
