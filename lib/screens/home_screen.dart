import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
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

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final MovieStore popularStore;
  late final MovieStore nowPlayingStore;
  late final MovieStore topRatedStore;

  @override
  void initState() {
    super.initState();
    popularStore = MovieStore(MovieRepositoryImpl(Dio()));
    nowPlayingStore = MovieStore(MovieRepositoryImpl(Dio()));
    topRatedStore = MovieStore(MovieRepositoryImpl(Dio()));

    popularStore.getPopularMovies(takeFive: true);
    nowPlayingStore.getNowPlayingMovies(takeFive: true);
    topRatedStore.getTopRatedMovies(takeFive: true);

    popularStore.addListener(storeListener);
    nowPlayingStore.addListener(storeListener);
    topRatedStore.addListener(storeListener);
  }

  @override
  void dispose() {
    popularStore.removeListener(storeListener);
    nowPlayingStore.removeListener(storeListener);
    topRatedStore.removeListener(storeListener);

    popularStore.dispose();
    nowPlayingStore.dispose();
    topRatedStore.dispose();

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
    super.build(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 0,
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
      body: Stack(
        children: [
          const GradientBackground(),
          SingleChildScrollView(
            controller: RootScreenControllers.homeScrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 120,
                    right: 16,
                    left: 16,
                  ),
                  child: Column(
                    children: [
                      MovieStoreBuilder(
                        store: popularStore,
                        isCarousel: true,
                        type: CategoryType.popular,
                      ),
                      const SizedBox(
                        height: Spacing.x16,
                      ),
                      MovieStoreBuilder(
                        store: nowPlayingStore,
                        isCarousel: false,
                        title: "Now Playing",
                        type: CategoryType.nowPlaying,
                      ),
                      const SizedBox(
                        height: Spacing.x16,
                      ),
                      MovieStoreBuilder(
                        store: topRatedStore,
                        isCarousel: false,
                        title: "Top Rated",
                        type: CategoryType.topRated,
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

  @override
  bool get wantKeepAlive => true;
}
