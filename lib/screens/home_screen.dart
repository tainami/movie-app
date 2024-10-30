import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/screens/root_screen.dart';
import 'package:movie_app/store/movie_state.dart';
import 'package:movie_app/store/movie_store.dart';
import 'package:movie_app/widgets/gradient_background.dart';
import 'package:movie_app/widgets/movie_store_builder.dart';
import 'package:movie_app/widgets/notification_icon.dart';
import 'package:movie_app/widgets/user_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MovieStore popularStore;
  late final MovieStore nowPlayingStore;
  late final MovieStore topRatedStore;

  @override
  void initState() {
    super.initState();
    popularStore = MovieStore(MovieRepositoryImpl(Dio()));
    nowPlayingStore = MovieStore(MovieRepositoryImpl(Dio()));
    topRatedStore = MovieStore(MovieRepositoryImpl(Dio()));

    popularStore.getPopularMovies();
    nowPlayingStore.getNowPlayingMovies();
    topRatedStore.getTopRatedMovies();

    popularStore.addListener(storeListener);
    nowPlayingStore.addListener(storeListener);
    topRatedStore.addListener(storeListener);
  }

  @override
  void dispose() {
    popularStore.removeListener(storeListener);
    nowPlayingStore.removeListener(storeListener);
    topRatedStore.removeListener(storeListener);
    super.dispose();
  }

  void storeListener() {
    if (popularStore.value is MovieStateError) {
      showSnackMessage();
    }
  }

  void showSnackMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Erro ao carregar filmes'),
        duration: Duration(seconds: 4),
      ),
    );
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                      MovieStoreBuilder(
                        store: popularStore,
                        isCarousel: true,
                      ),
                      const SizedBox(
                        height: Spacing.x16,
                      ),
                      MovieStoreBuilder(
                        store: nowPlayingStore,
                        isCarousel: false,
                        title: "Recent",
                      ),
                      const SizedBox(
                        height: Spacing.x16,
                      ),
                      MovieStoreBuilder(
                        store: topRatedStore,
                        isCarousel: false,
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
